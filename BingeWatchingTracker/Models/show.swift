//
//  show.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 12/24/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import Foundation

struct Show{
    
    var name: String
    var imageName: String
    var episodes: [Episode]
    var favorite: Bool
    
    init(name: String, imageName: String, episodes: [Episode], favorite: Bool) {
        self.name = name
        self.imageName =  imageName
        self.episodes = episodes
        self.favorite = false
    }
}
