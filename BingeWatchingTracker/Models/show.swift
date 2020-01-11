//
//  show.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 12/24/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import Foundation

struct Show: Codable{
    
    var name: String
    var favorite: Bool
    var episodes: [Episode]
    
    
    init(name: String, favorite: Bool, episodes: [Episode]) {
        self.name = name
        self.episodes = episodes
        self.favorite = false
    }
}
