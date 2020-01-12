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

    @IBOutlet weak var sceneTitle: UINavigationItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myShowLabel: UILabel!
    
    // MARK: - Properties
    
    var catalogIndex: Int?
    var tvShow: Show?
    
    // MARK: - Methods
    
    func updateView(){
        guard let tvShow = tvShow else { return }
        imageView.image = UIImage(named: tvShow.name)
        switch true{
        case tvShow.favorite == true:
            myShowLabel.text = "Remove From Favorites"
        default:
            myShowLabel.text = "Add To Favorites"
        }
        sceneTitle.title = tvShow.name
    }
    
    // MARK: - IBActions
      
    @IBAction func addToMyListTapped(_ sender: UIButton) {
        TVShows.shared.favoriteShow(catalogIndex)
        TVShows.shared.saveToPersistentStore()
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return (tvShow?.episodes.count)!
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tvShow?.episodes[section].count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeTableViewCell else { return UITableViewCell() }
        let seasonIndex = indexPath.section
        let episodeIndex = indexPath.row
        let episodeInformation = tvShow?.episodes[seasonIndex][episodeIndex]
        
        cell.seasonIndex = seasonIndex
        cell.episodeInformation = episodeInformation
        cell.episodeIndex = episodeIndex
        cell.catalogIndex = catalogIndex
        cell.delegate = self
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
}

extension TVShowDetailViewController: EpisodeHasBeenBinged{

    // MARK: - DelegateMethod
    
    func toggleEpisodeWatched(_ seasonIndex: Int, _ episodeIndex: Int){
        tvShow?.episodes[seasonIndex][episodeIndex].binged.toggle()
        self.tableView.reloadData()
    }
}
