//
//  CentralLeagueTableViewController.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 12/9/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import UIKit


class CentralLeagueTableViewController: UITableViewController {
    
    
    private let dataSource = DataSource()
    let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.tabBarController!.selectedIndex)
        dataSource.teams = ["Toyo Carp","Hanshin Tigers","DeNA BayStars","Yomiuri Giants","Chunichi Dragons","Yakult Swallows"]
        dataSource.address = ["2 Chome-3-1 Minamikaniya, Minami Ward, Hiroshima, Hiroshima Prefecture 732-0803, Japan", "1-82 Koshiencho, Nishinomiya, Hyōgo Prefecture 663-8152, Japan","Yokohamakoen, Naka Ward, Yokohama, Kanagawa Prefecture 231-0022, Japan","1 Chome-3-61 Koraku, Bunkyō, Tokyo 112-0004, Japan","1 Chome-1-1 Daikominami, Higashi Ward, Nagoya, Aichi Prefecture 461-0047, Japan","3-1 Kasumigaokamachi, Shinjuku, Tokyo 160-0013, Japan"]
        dataSource.city = ["Hiroshima", "Nishinomiya","Yokohama","Tokyo","Nagoya","Shinjuku"]
        dataSource.identifier = "centralLeaguePrototype"
        dataSource.images = [ UIImage(named: "toyocarps")!, UIImage(named: "tigers")!,UIImage(named: "baystars")!,UIImage(named: "giants")!,UIImage(named: "dragons")!,UIImage(named: "swallos")!]
        
        dataSource.colors = [UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0), .white,UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0),.white,UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0), .white]
        

        dataSource.latitudes = [34.392126,34.721577,35.443564,35.705840,35.186723,35.674789]
        
        dataSource.longitudes = [132.484640,135.361593,139.640040,139.751913,136.946950,139.717049]

        tableView.dataSource = dataSource
        
        let screenHeight = screenSize.height
        self.tableView.rowHeight = screenHeight * 0.15
    

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        LeagueMapController.sharedInstance.myIndex = indexPath.row
        LeagueMapController.sharedInstance.teamArray = dataSource.teams
        LeagueMapController.sharedInstance.address = dataSource.address[LeagueMapController.sharedInstance.myIndex]
        LeagueMapController.sharedInstance.latitudeChosen = dataSource.latitudes[LeagueMapController.sharedInstance.myIndex]
        LeagueMapController.sharedInstance.longitudeChosen = dataSource.longitudes[LeagueMapController.sharedInstance.myIndex]
        LeagueMapController.sharedInstance.teamChosen = LeagueMapController.sharedInstance.teamArray[LeagueMapController.sharedInstance.myIndex]
        performSegue(withIdentifier: "showStores", sender: self)
    }
    
}

