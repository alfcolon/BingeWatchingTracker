//
//  TVShowViewController.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 1/8/20.
//  Copyright © 2020 TeamFlash. All rights reserved.
//

import UIKit

class TVShowViewController: UIViewController, UICollectionViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = CustomImageLayout()
    }
    
    //MARK: -IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "TVShowDetailSegue" else { return }
        guard let showDetailVC = segue.destination as? TVShowDetailViewController else { return }
        
        let row = self.collectionView!.indexPathsForSelectedItems![0][1]
        let show = tvShows.catalog[row]
        
        showDetailVC.showIndex = row
        showDetailVC.show = show
    }
    
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tvShows.catalog.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVShowCell", for: indexPath) as? TVShowCollectionViewCell else { return UICollectionViewCell() }
    
        // Configure the cell
        let tvShowName = tvShows.catalog[indexPath.row].name
        let posterName = tvShowName + "Poster"
        cell.poster = UIImage(named: posterName)
        return cell
    }

}

class CustomImageLayout: UICollectionViewFlowLayout {

    var numberOfColumns: CGFloat = 3.0

    override init() {
        super.init()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }

    override var itemSize: CGSize {
        set { }
        get {
            let itemWidth = (self.collectionView!.frame.width - (self.numberOfColumns - 1)) / self.numberOfColumns
            return CGSize(width: itemWidth, height: itemWidth * 1.5)
        }
    }

    func setupLayout() {
        minimumInteritemSpacing = 1 // Set to zero if you want
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
}
