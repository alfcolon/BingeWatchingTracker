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
        collectionView.collectionViewLayout = CustomCollectionViewImageLayout()
    }
    
    //MARK: -IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: -Properties
    
    let tvShowController = TVShows.shared
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "TVShowDetailSegue" else { return }
        guard let showDetailVC = segue.destination as? TVShowDetailViewController else { return }
        
        let row = self.collectionView!.indexPathsForSelectedItems![0][1]
        let show = tvShowController.catalog[row]
        
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
        return tvShowController.catalog.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVShowCell", for: indexPath) as? TVShowCollectionViewCell else { return UICollectionViewCell() }
    
        // Configure the cell
        let tvShowName = tvShowController.catalog[indexPath.row].name
        let posterName = tvShowName + "Poster"
        cell.poster = UIImage(named: posterName)
        return cell
    }

}
