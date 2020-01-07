//
//  ShowHasBeenFavorited.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 12/28/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import Foundation

protocol UpdateShowInformation{
    func informationToUpdate(showIndex: Int, episodeIndex: Int?, favorited: Bool?)
}
