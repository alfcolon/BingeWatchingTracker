//
//  PersistentBingeController.swift
//  BingeWatchingTracker
//
//  Created by David Williams on 1/8/20.
//  Copyright © 2020 TeamFlash. All rights reserved.
//

import Foundation

class PersistentBingeController {
    
    private(set) var shows: [Show] = []
    
    init() {
        if firstRun() {
            loadStaticData()
        } else {
            loadFromPersistentStore()
        }
    }
    
        func firstRun() -> Bool {
            return true
        }
        
        func loadStaticData() {
            shows =
                [
                    Show(name: "Arrow", imageName: "",
                         episodes: [
                            Episode(name: "Pilot", binged: false),
                            Episode(name: "Honor Thy Father", binged: false),
                            Episode(name: "Lone Gunmen", binged: false),
                            Episode(name: "An Innocent Man", binged: false),
                            Episode(name: "Damaged", binged: false),
                            Episode(name: "Legacies", binged: false),
                            Episode(name: "Muse Of Fire", binged: false)
                        ],
                         favorite: false),
                    Show(name: "The Flash", imageName: "",
                         episodes: [
                            Episode(name: "Pilot", binged: false),
                            Episode(name: "Fastest Man Alive", binged: false),
                            Episode(name: "Things You Cannot Outrun", binged: false),
                            Episode(name: "Going Rogue", binged: false),
                            Episode(name: "Plastique", binged: false),
                            Episode(name: "The Flash Is Born", binged: false),
                            Episode(name: "Power Outage", binged: false)
                        ],
                         favorite: false),
                    Show(name: "DareDevil", imageName: "",
                         episodes: [
                            Episode(name: "Into The Ring", binged: false),
                            Episode(name: "Cut Man", binged: false),
                            Episode(name: "Rabbit In A Snowstorm", binged: false),
                            Episode(name: "In The Blood", binged: false),
                            Episode(name: "World On Fire", binged: false),
                            Episode(name: "Condemned", binged: false),
                            Episode(name: "Stick", binged: false)
                        ],
                         favorite: false)
            ]
        }
        
        @discardableResult func create(name: String, imageName: String, episodes: [Episode], favorite: Bool = false) -> Show {
            let show = Show(name: name, imageName: imageName, episodes: episodes, favorite: favorite)
            saveToPersistentStore()
            return show
        }
        
        func toggleFavorite(for show: Show) {
            guard let index = shows.firstIndex(of: show) else { return }
            shows[index].favorite.toggle()
            saveToPersistentStore()
        }
        
        func toggleBinged(for episode: Episode, show: Show) {
            guard let index = shows.firstIndex(of: show),
                let eIndex = shows[index].episodes.firstIndex(of: episode) else { return }
            shows[index].episodes[eIndex].binged.toggle()
            saveToPersistentStore()
        }
        
        private var persistentFileURL: URL? {
            let fileManager = FileManager.default
            guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            
            return documents.appendingPathComponent("binge.plist")
        }
        
        func saveToPersistentStore() {
            guard let url = persistentFileURL else { return }
            do {
                let encoder = PropertyListEncoder()
                let data = try encoder.encode(shows)
                try data.write(to: url)
            } catch {
                print("Error saving Binge data: \(error)")
            }
        }
        
        func loadFromPersistentStore() {
            let fileManager = FileManager.default
            guard let url = persistentFileURL,
                fileManager.fileExists(atPath: url.path) else { return }
            
            do {
                let data =  try Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                shows =  try decoder.decode([Show].self, from: data)
            } catch {
                print("Error loading Binge data: \(error)")
            }
        }
}
