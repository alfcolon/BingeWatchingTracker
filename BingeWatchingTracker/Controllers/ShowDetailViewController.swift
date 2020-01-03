//
//  ShowDetailViewController.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 12/25/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController {
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Properties
    
    var show: Show?
    var delegate: UpdateShowInformation?
    var row: Int?
    
    // MARK: - Methods
    
    func updateView(){
        guard let _ = show else { return }
        titleLabel.text = show!.name
        imageView.image = UIImage(named: show!.name)
        if show!.favorite == true{
            favoriteButton.setImage(UIImage(named: "F2"), for: .normal)
        }
        else{
            favoriteButton.setImage(UIImage(named: "NF2"), for: .normal)
        }
    }
    
    // MARK: - IBActions
      
    @IBAction func favoriteTapped(_ sender: UIButton) {
        guard let _ = row else { return }
        if show!.favorite == true{
                      favoriteButton.setImage(UIImage(named: "NF2"), for: .normal)
                  }
                  else{
                      favoriteButton.setImage(UIImage(named: "F2"), for: .normal)
                  }
        delegate?.informationToUpdate(showIndex: row!, episodeIndex: nil, favorited: !show!.favorite)
       
        self.reloadInputViews()
    }
}
extension ShowDetailViewController: UITableViewDataSource{
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let show = show else { return 1 }
        return show.episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeTableViewCell else { return UITableViewCell() }
        if let show = show{
            let episode = show.episodes[indexPath.row]
            cell.episodeInformation = episode
            cell.delegate = self
            cell.row = indexPath.row
            return cell
        }
        return UITableViewCell()
    }
}

extension ShowDetailViewController: EpisodeHasBeenBinged{
    
    // MARK: - DelegateMethod
    
    func toggleEpisodeWatched(i: Int){
        guard let _ = show else { return }
        show!.episodes[i].binged = !show!.episodes[i].binged
        self.tableView.reloadData()
        delegate?.informationToUpdate(showIndex: row!, episodeIndex: i, favorited: nil)
    }
}


