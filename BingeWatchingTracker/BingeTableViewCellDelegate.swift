//
//  BingeTableViewDelegate.swift
//  BingeWatchingTracker
//
//  Created by David Williams on 12/20/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import Foundation

protocol BingeTableViewCellDelegate {
    func toggleHasBeenWatched(for cell: BingeTableViewCell)
}
