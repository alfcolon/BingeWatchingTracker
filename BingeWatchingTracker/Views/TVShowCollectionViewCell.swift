//
//  TVShowCollectionViewCell.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 1/7/20.
//  Copyright © 2020 TeamFlash. All rights reserved.
//

import UIKit

class TVShowCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var TVShowPoster: UIImageView!
    
    var poster: UIImage?{
           didSet{
               updateViews()
           }
       }
    func updateViews(){
        TVShowPoster.image = poster
    }
}
