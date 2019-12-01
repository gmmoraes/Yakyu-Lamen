//
//  LeagueTableViewController.swift
//  Yakyu Ramen
//
//  Created by Gabriel on 1/3/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit

class LeagueTableViewController: UITableViewController {
    
    
    private let dataSource = DataSource()
    private let centralLeague = CentralLeagueDataSource()
    private let pacificLeague = PacificLeagueDataSource()
    let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.tabBarController!.selectedIndex)
        if(self.tabBarController!.selectedIndex==0){
            dataSource.teams = centralLeague.teams
            dataSource.address = centralLeague.address
            dataSource.latitudes = centralLeague.latitudes
            dataSource.city = centralLeague.city
            dataSource.identifier = "centralLeaguePrototype"
            dataSource.images = centralLeague.images
            dataSource.colors = centralLeague.colors
            dataSource.latitudes = centralLeague.latitudes
            dataSource.longitudes = centralLeague.longitudes

            
        }else if(self.tabBarController!.selectedIndex==1){
            dataSource.teams = pacificLeague.teams
            dataSource.address = pacificLeague.address
            dataSource.latitudes = pacificLeague.latitudes
            dataSource.city = pacificLeague.city
            dataSource.identifier = "pacificLeaguePrototype"
            dataSource.images = pacificLeague.images
            dataSource.colors = pacificLeague.colors
            dataSource.latitudes = pacificLeague.latitudes
            dataSource.longitudes = pacificLeague.longitudes
        }

        
        tableView.dataSource = dataSource
        
        let screenHeight = screenSize.height
        self.tableView.rowHeight = screenHeight * 0.15
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(self.tabBarController!.selectedIndex==0){
            LeagueMapController.sharedInstance.myIndex = indexPath.row
            LeagueMapController.sharedInstance.teamArray = centralLeague.teams
            LeagueMapController.sharedInstance.address = centralLeague.address[LeagueMapController.sharedInstance.myIndex]
            LeagueMapController.sharedInstance.latitudeChosen = centralLeague.latitudes[LeagueMapController.sharedInstance.myIndex]
            LeagueMapController.sharedInstance.longitudeChosen = centralLeague.longitudes[LeagueMapController.sharedInstance.myIndex]
            LeagueMapController.sharedInstance.teamChosen = LeagueMapController.sharedInstance.teamArray[LeagueMapController.sharedInstance.myIndex]
            performSegue(withIdentifier: "showStores", sender: self)
            
        }else if(self.tabBarController!.selectedIndex==1){
            LeagueMapController.sharedInstance.myIndex = indexPath.row
            LeagueMapController.sharedInstance.teamArray = pacificLeague.teams
            LeagueMapController.sharedInstance.address = pacificLeague.address[LeagueMapController.sharedInstance.myIndex]
            LeagueMapController.sharedInstance.latitudeChosen = pacificLeague.latitudes[LeagueMapController.sharedInstance.myIndex]
            LeagueMapController.sharedInstance.longitudeChosen = pacificLeague.longitudes[LeagueMapController.sharedInstance.myIndex]
            LeagueMapController.sharedInstance.teamChosen = LeagueMapController.sharedInstance.teamArray[LeagueMapController.sharedInstance.myIndex]
            performSegue(withIdentifier: "pacificLeagueShowStores", sender: self)
        }

    }
    

}



