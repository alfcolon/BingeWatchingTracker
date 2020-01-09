//
//  BingeTableViewController.swift
//  BingeWatchingTracker
//
//  Created by David Williams on 12/20/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import UIKit

class BingeTableViewCell: UITableViewCell {

    @IBOutlet weak var showShow: UILabel!
    
    var show: Show? {
        didSet {
            updateViews()
        }
    }
        var delegate: BingeTableViewCellDelegate?
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }
        
        func updateViews() {
            showShow.text = show?.name
        }
}
