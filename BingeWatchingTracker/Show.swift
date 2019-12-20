//
//  Show.swift
//  BingeWatchingTracker
//
//  Created by David Williams on 12/20/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import UIKit

struct Show: Codable {
    
    var name: String
    var imageName: String
    var episodes: [Episode]
    
    init(name: String, imageName: String, episodes: [Episode]) {
        self.name = name
        self.imageName =  imageName
        self.episodes = episodes
    }
}
