//
//  BingeController.swift
//  BingeWatchingTracker
//
//  Created by David Williams on 12/20/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import Foundation

class BingeController {
    
    var allShows: [Show] =
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
            ]),
                Show(name: "The Flash", imageName: "",
                     episodes: [
                    Episode(name: "Pilot", binged: false),
                    Episode(name: "Fastest Man Alive", binged: false),
                    Episode(name: "Things You Cannout Outrun", binged: false),
                    Episode(name: "Going Rogue", binged: false),
                    Episode(name: "Plastique", binged: false),
                    Episode(name: "The Flash Is Born", binged: false),
                    Episode(name: "Power Outage", binged: false)
            ]),
                Show(name: "DareDevil", imageName: "",
                     episodes: [
                    Episode(name: "Into The Ring", binged: false),
                    Episode(name: "Cut Man", binged: false),
                    Episode(name: "Rabbit In A Snowstorm", binged: false),
                    Episode(name: "In The Blood", binged: false),
                    Episode(name: "World On Fire", binged: false),
                    Episode(name: "Condemned", binged: false),
                    Episode(name: "Stick", binged: false)
            ])
        ]
      //  return self.allShows
}
