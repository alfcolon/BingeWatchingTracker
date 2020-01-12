//
//  CustomCollectionViewImageLayout.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 1/10/20.
//  Copyright © 2020 TeamFlash. All rights reserved.
//

import UIKit

class CustomCollectionViewImageLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setupLayout()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    //MARK: -Properties
    
    let numberOfColumns: CGFloat = 3.0
    
    override var itemSize: CGSize {
        set { }
        get {
            let itemWidth = (self.collectionView!.frame.width - (self.numberOfColumns - 1)) / self.numberOfColumns
            return CGSize(width: itemWidth, height: itemWidth * 1.6)
        }
    }
    
    //MARK: -Methods
    
    func setupLayout() {
        minimumInteritemSpacing = 1 // Set to zero if you want
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
}
