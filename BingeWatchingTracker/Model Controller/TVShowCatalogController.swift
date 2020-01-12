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
        catalog = TVShowCatalog().tvShowCatalog
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
    
    func getCatalogIndexOfTVShow(_ tvShowName: String)->Int{
        return catalog.firstIndex(where: { $0.name == tvShowName })!
    }
    func getFavoriteShows()->[Show]{
        let favoriteShows = catalog.filter { (show: Show) -> Bool in
            return show.favorite == true
        }
        return favoriteShows
    }
    func favoriteShow(_ catalogIndex: Int?){
        guard let index = catalogIndex else { return }
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
    func episodeWatched(_ catalogIndex: Int, _ seasonIndex: Int, _ episodeIndex: Int){
        self.catalog[catalogIndex].episodes[seasonIndex][episodeIndex].binged.toggle()
        saveToPersistentStore()
    }
}

