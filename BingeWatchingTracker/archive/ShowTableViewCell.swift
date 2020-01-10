//
//  ShowTableViewCell.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 12/24/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell{
    
    //MARK: -Outlets
    
    @IBOutlet weak var showLabel: UILabel!
    
    //MARK: -Properties
    
    var show: Show?{
        didSet{
            updateViews()
        }
    }
    var showIndex: Int?
    var delegate: EpisodeHasBeenBinged?
    //MARK: -Methods
    
    private func updateViews(){
        guard let show = show else { return }
        showLabel.text = show.name
    }
}
