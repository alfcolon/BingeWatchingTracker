//
//  EpisodeTableViewCell.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 12/25/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var bingedToggle: UISwitch!
    
    //MARK: - Properties
    
    var episodeInformation: Episode?{
        didSet{
            updateView()
        }
    }
    var delegate: EpisodeHasBeenBinged?
    var episodeIndex: Int!
    var catalogIndex: Int!
    var seasonIndex: Int!
      
    // MARK: - Methods
    
    func updateView(){
        guard let episode = episodeInformation else { return }
        episodeLabel.text = episode.name
        bingedToggle.isOn = episode.binged
    }
      
    // MARK: - IBActions
    
    @IBAction func bingedToggleButtonPressed(_ sender: UISwitch!) {
        TVShows.shared.episodeWatched(catalogIndex, seasonIndex, episodeIndex)
        delegate?.toggleEpisodeWatched(seasonIndex, episodeIndex)
    }
    
}
