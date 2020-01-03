//
//  BingeListViewController.swift
//  BingeWatchingTracker
//
//  Created by alfredo on 12/24/19.
//  Copyright © 2019 TeamFlash. All rights reserved.
//

import UIKit

//1.Create class for BingeList Scene
class BingeListViewController: UIViewController {
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties

    var shows: BingeController = BingeController() //load data
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetailSegue" else { return }
        guard let showDetailVC = segue.destination as? ShowDetailViewController else { return }
        // Pass the selected object to the new view controller.
        let indexPathForSelectedRow = tableView.indexPathForSelectedRow!.row
        let show = shows.allShows[indexPathForSelectedRow]
        //delegate
        showDetailVC.delegate = self
        showDetailVC.row = indexPathForSelectedRow
        showDetailVC.show = show
    }
}

//2.Update the table/Have VC class conform to UITableViewDataSource (add IBOutlet to original class definition)
extension BingeListViewController: UITableViewDataSource{
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.allShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as? ShowTableViewCell else { return UITableViewCell() }
        let show = shows.allShows[indexPath.row]
        cell.show = show
        cell.row = indexPath.row
        cell.delegate = self
        return cell
    }
}
extension BingeListViewController: UpdateShowInformation{
    
    // MARK: - DelegateMethod
    
    func informationToUpdate(showIndex: Int, episodeIndex: Int?, favorited: Bool?){
        if let _ = favorited{
            shows.allShows[showIndex].favorite.toggle()
        }
        if let _  = episodeIndex{
            shows.allShows[showIndex].episodes[episodeIndex!].binged.toggle()
        }
        self.tableView.reloadData()
    }
}
