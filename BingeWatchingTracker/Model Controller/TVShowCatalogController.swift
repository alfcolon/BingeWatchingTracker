//
//  TVShowCatalogController.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 1/9/20.
//  Copyright © 2020 TeamFlash. All rights reserved.
//

import Foundation

//MARK: -GlobalVariables

var tvShows = TVShows()

class TVShows{
    
    //MARK: -Properties
    
    var catalog: [Show] =
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
                Show(name: "TheFlash", imageName: "",
                     episodes: [
                    Episode(name: "Pilot", binged: false),
                    Episode(name: "Fastest Man Alive", binged: false),
                    Episode(name: "Things You Cannout Outrun", binged: false),
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
    
    //MARK: -Methods
    func getFavoriteShows()->[Show]{
        let favoriteShows = catalog.filter { (show: Show) -> Bool in
            return show.favorite == true
        }
        return favoriteShows
    }
    func favoriteShow(showIndex: Int?){
        guard let index = showIndex else { return }
        tvShows.catalog[index].favorite.toggle()
    }
    func filterShows(textToMatch: String)->[Show]{
        guard textToMatch != "" else { return [] }
        let filteredShows = catalog.filter { (show: Show) -> Bool in
            return show.name.range(of: textToMatch, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        return filteredShows
    }
    func episodeWatched(showIndex: Int, episodeIndex: Int){
        tvShows.catalog[showIndex].episodes[episodeIndex].binged.toggle()
    }
}
