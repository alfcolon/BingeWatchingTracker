//
//  TVShowDetailViewController.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 12/25/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import UIKit

class TVShowDetailViewController: UIViewController {
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var myShowLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    // MARK: - Properties
    
    var showIndex: Int?
    var show: Show?
    
    // MARK: - Methods
    
    func updateView(){
        guard let tvShow = show else { return }
        imageView.image = UIImage(named: tvShow.name)
        switch true{
        case tvShow.favorite == true:
            myShowLabel.text = "Remove From Favorites"
        default:
            myShowLabel.text = "Add To Favorites"
        }
        navigationBar.title = tvShow.name
    }
    
    // MARK: - IBActions
      
    @IBAction func addToMyListTapped(_ sender: UIButton) {
        tvShows.favoriteShow(showIndex: showIndex)
        switch true{
        case myShowLabel.text == "Add To Favorites":
            myShowLabel.text = "Remove From Favorites"
        case myShowLabel.text == "Remove From Favorites":
            myShowLabel.text = "Add To Favorites"
        default:
            break
        }
    }
}
extension TVShowDetailViewController: UITableViewDataSource{
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let show = show else { return 1 }
        return show.episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeTableViewCell else { return UITableViewCell() }
        
        let episode = show?.episodes[indexPath.row]
        
        cell.episodeInformation = episode
        cell.episodeIndex = indexPath.row
        cell.showIndex = showIndex
        cell.delegate = self
        
        return cell
    }
}

extension TVShowDetailViewController: EpisodeHasBeenBinged{

    // MARK: - DelegateMethod
    
    func toggleEpisodeWatched(index: Int){
        print(index)
        show?.episodes[index].binged.toggle()
        self.tableView.reloadData()
    }
}


