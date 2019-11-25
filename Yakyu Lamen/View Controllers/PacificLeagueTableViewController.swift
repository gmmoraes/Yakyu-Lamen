//
//  PacificLeagueTableViewController.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 12/9/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import UIKit


class PacificLeagueTableViewController: UITableViewController {
    
    private let dataSource = DataSource()
    let screenSize = UIScreen.main.bounds
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.teams = ["SoftBank Hawks", "Seibu Lions", "Rakuten G. Eagles", "ORIX Buffaloes", "Nippon-Ham F.", "Lotte Marines"]
        dataSource.address = ["2 Chome-2-2 Jigyohama, Chuo , Fukuoka, Fukuoka Prefecture 810-8660, Japan", "2135 Kami-Yamaguchi, Tokorozawa City, Saitama","2 Chome-11-6 Miyagino, Miyagino Ward, Sendai, Miyagi Prefecture 983-0045, Japan","京セラドーム大阪, Japão, 〒550-0023 Ōsaka-fu, Ōsaka-shi, Nishi-ku, Chiyozaki, 3 Chome−中２−1","1 Hitsujigaoka, Toyohira Ward, Sapporo, Hokkaido 062-0045, Japan","1 Mihama, Mihama Ward, Chiba, Chiba Prefecture 261-0022, Japan"]
        dataSource.city = ["Fukuoka", "Tokorozawa", "Sendai", "Osaka", "Sapporo","Chiba"]
        dataSource.identifier = "pacificLeaguePrototype"
        dataSource.images = [ UIImage(named: "hawks")!, UIImage(named: "seibu")!,UIImage(named: "eagles")!,UIImage(named: "buffalos")!,UIImage(named: "nipponham")!,UIImage(named: "marines")!]
        
        dataSource.colors = [UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0), .white,UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0),.white,UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0), .white]
        

        dataSource.latitudes = [33.595629,35.768620,38.256594,34.669796,43.016844,35.645466]
        
        dataSource.longitudes = [130.362227,139.420546,140.902580,135.476039,141.411246,140.030920]
        
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
        performSegue(withIdentifier: "pacificLeagueShowStores", sender: self)
    }
    
}
