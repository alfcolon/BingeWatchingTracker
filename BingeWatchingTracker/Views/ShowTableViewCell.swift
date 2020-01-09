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
    
    var show: Show? {
        didSet{
            updateViews()
        }
    }
    var row: Int?
    var delegate: UpdateShowInformation?
    
    //MARK: -Methods
    
    private func updateViews() {
        guard let show = show else { return }
        showLabel.text = show.name
    }
    #warning("what is setting the value of 'row'?")
    @IBAction func favoriteTapped(_ sender: UIButton) {
        guard let _ = row else { return }
        delegate?.informationToUpdate(showIndex: row!, episodeIndex: nil, favorited: !show!.favorite)
    }
}
