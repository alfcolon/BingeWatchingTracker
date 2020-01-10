//
//  SearchViewController.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 1/8/20.
//  Copyright © 2020 TeamFlash. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate{

        override func viewDidLoad() {
            super.viewDidLoad()
            collectionView.collectionViewLayout = CustomImageLayout()
        }

        //MARK: -Properties
    
        var filteredShows: [Show] = []
    
        //MARK: -IBOutlets

        @IBOutlet weak var collectionView: UICollectionView!
        @IBOutlet weak var searchBar: UISearchBar!

        // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "TVShowDetailSegue" else { return }
            guard let showDetailVC = segue.destination as? TVShowDetailViewController else { return }
            let row = self.collectionView!.indexPathsForSelectedItems![0][1]
            let show = filteredShows[row]
            let showIndex = TVShows.shared.catalog.firstIndex(where: { $0.name == show.name })
            
            showDetailVC.showIndex = showIndex
            showDetailVC.show = show
        }
        
        // MARK: UICollectionViewDataSource

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of items
            return filteredShows.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TVShowCell", for: indexPath) as? TVShowCollectionViewCell  else { return UICollectionViewCell() }
        
            // Configure the cell
            let tvShowName = filteredShows[indexPath.row].name
            let posterName = tvShowName + "Poster"
            cell.TVShowPoster.image = UIImage(named: posterName)
            return cell
        }
    
        //MARK: UISeachControllerDelegate

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            filteredShows = searchText.isEmpty ? [] : TVShows.shared.filterShows(textToMatch: searchText)
            collectionView.reloadData()
            print(searchText)
        }
}
