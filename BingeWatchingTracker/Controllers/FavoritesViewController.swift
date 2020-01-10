//
//  FavoritesCollectionViewController.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 1/9/20.
//  Copyright © 2020 TeamFlash. All rights reserved.
//

import UIKit

class FavoritesCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = CustomImageLayout()
    }

    //MARK: -Properties

    var favoriteShows: [Show] = tvShows.getFavoriteShows()

    //MARK: -IBOutlets

//    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "TVShowDetailSegue" else { return }
        guard let showDetailVC = segue.destination as? TVShowDetailViewController else { return }
        let row = self.collectionView!.indexPathsForSelectedItems![0][1]
        let show = favoriteShows[row]
        let showIndex = tvShows.catalog.firstIndex(where: { $0.name == show.name })
        
        showDetailVC.showIndex = showIndex
        showDetailVC.show = show
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return favoriteShows.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVShowCell", for: indexPath) as? TVShowCollectionViewCell  else { return UICollectionViewCell() }
    
        // Configure the cell
        let tvShowName = favoriteShows[indexPath.row].name
        let posterName = tvShowName + "Poster"
        cell.TVShowPoster.image = UIImage(named: posterName)
        return cell
    }
}
