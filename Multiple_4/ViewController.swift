//
//  ViewController.swift
//  Multiple_4
//
//  Created by Ahreum CHO on 2020/08/02.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Moya
import ProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var getNowPlayingData:[Movie] = []
    var GetpopularData:[Movie] = []
    var movies:[Movie] = []
    var upComingMovie:[Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.getNetwork()
    }
    
    func getNetwork(){
        MovieAPI.getNowplayingNetwork(page: 1) { (movie) in
            self.getNowPlayingData = movie
            self.tableView.reloadData()
            ProgressHUD.dismiss()
        }
        
        MovieAPI.getPopularNetwork(page: 1) { (movie) in
            self.GetpopularData = movie
            self.tableView.reloadData()
            ProgressHUD.dismiss()
        }
        MovieAPI.getUpcoming(page: 1) { (movie) in
            self.upComingMovie = movie
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow
        guard indexPath != nil else {
            return
        }
        
        if indexPath!.section == 0 {
            
            let nextVC = segue.destination as! DetailPageViewController
            nextVC.id = getNowPlayingData[indexPath!.row].id
        } else {
            
            let nextVC = segue.destination as! DetailPageViewController
            nextVC.id = GetpopularData[indexPath!.row].id
        }
       
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return getNowPlayingData.count
        } else if section == 1{
            return GetpopularData.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! GetNowPlayingTableViewCell
            cell.getDisplay(movie: getNowPlayingData[indexPath.row])
            
            return cell
            
        } else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "customcell2", for: indexPath) as! GetpopularTableViewCell
            cell.getDidplayCell2(movie: GetpopularData[indexPath.row])
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3Id") as! MovieCollecttionTableViewCell
            
            cell.upcomingMovie = self.upComingMovie
            return cell
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Now Playing"
        } else if section == 1  {
            return "Popular Movie"
        } else {
            return "Upcoming Movie"
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            print(getNowPlayingData[indexPath.row].id)
//
//            let nextVC = self.segue.destination as! DetailPageViewController
//            nextVC.id = getNowPlayingData[indexPath.row].id
//
//
//
//
//        } else {
//            print(GetpopularData[indexPath.row].id)
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch indexPath.section {
            case 2:
                return 300
            default:
                return 150
            }
    }
}
