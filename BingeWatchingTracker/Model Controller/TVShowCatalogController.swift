//
//  TVShowCatalogController.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 1/9/20.
//  Copyright © 2020 TeamFlash. All rights reserved.
//

import Foundation

class TVShows{
    
    init(){
        loadFromPersistentStore()
        if catalog.isEmpty{
            create()
        }
    }
    //MARK: -Simpleton
    
    static let shared = TVShows()
    
    //MARK: -Properties
    
    var catalog: [Show] = []
    
    //MARK: -Methods
    
    func create(){
        let arrow = Show(name: "Arrow", favorite: false,
         episodes: [
            Episode(name: "Pilot", binged: false),
            Episode(name: "Honor Thy Father", binged: false),
            Episode(name: "Lone Gunmen", binged: false),
            Episode(name: "An Innocent Man", binged: false),
            Episode(name: "Damaged", binged: false),
            Episode(name: "Legacies", binged: false),
            Episode(name: "Muse Of Fire", binged: false)
        ])
        let theFlash = Show(name: "TheFlash", favorite: false,
             episodes: [
            Episode(name: "Pilot", binged: false),
            Episode(name: "Fastest Man Alive", binged: false),
            Episode(name: "Things You Cannout Outrun", binged: false),
            Episode(name: "Going Rogue", binged: false),
            Episode(name: "Plastique", binged: false),
            Episode(name: "The Flash Is Born", binged: false),
            Episode(name: "Power Outage", binged: false)
        ])
        let dareDevil = Show(name: "DareDevil", favorite: false,
                     episodes: [
                    Episode(name: "Into The Ring", binged: false),
                    Episode(name: "Cut Man", binged: false),
                    Episode(name: "Rabbit In A Snowstorm", binged: false),
                    Episode(name: "In The Blood", binged: false),
                    Episode(name: "World On Fire", binged: false),
                    Episode(name: "Condemned", binged: false),
                    Episode(name: "Stick", binged: false)
        ])
        catalog.append(arrow)
        catalog.append(theFlash)
        catalog.append(dareDevil)
        saveToPersistentStore()
    }
    
    //MARK: -PersistenceMethods
    
    //get URL
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        //get the first url in Apps document folder
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        
        return documents.appendingPathComponent("catalog.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(catalog)
            
            try data.write(to: url)
        } catch {
            print("Error saving catalog data: \(error)")
        }
    }
    
    func loadFromPersistentStore(){
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            catalog = try decoder.decode([Show].self, from: data)
        } catch {
            print("Error saving catalog data: \(error)")
        }
    }
    
    //MARK: -Methods
    
    func getFavoriteShows()->[Show]{
        let favoriteShows = catalog.filter { (show: Show) -> Bool in
            return show.favorite == true
        }
        return favoriteShows
    }
    func favoriteShow(showIndex: Int?){
        guard let index = showIndex else { return }
        self.catalog[index].favorite.toggle()
        saveToPersistentStore()
    }
    func filterShows(textToMatch: String)->[Show]{
        guard textToMatch != "" else { return [] }
        let filteredShows = catalog.filter { (show: Show) -> Bool in
            return show.name.range(of: textToMatch, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        return filteredShows
    }
    func episodeWatched(showIndex: Int, episodeIndex: Int){
        self.catalog[showIndex].episodes[episodeIndex].binged.toggle()
        saveToPersistentStore()
    }
}
