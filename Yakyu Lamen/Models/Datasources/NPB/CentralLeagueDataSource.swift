//
//  CentralLeagueDataSource.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 1/3/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation
import UIKit

class CentralLeagueDataSource: DataSource {
//teams: Array<String>, address: Array<String>, city: Array<String>, identifier: String, images:Array<UIImage>,colors:Array<UIColor>,latitudes:Array<Double>,longitudes:Array<Double>
    override init() {
        super.init()
        self.teams = ["Toyo Carp","Hanshin Tigers","DeNA BayStars","Yomiuri Giants","Chunichi Dragons","Yakult Swallows"]
        self.address = ["2 Chome-3-1 Minamikaniya, Minami Ward, Hiroshima, Hiroshima Prefecture 732-0803, Japan", "1-82 Koshiencho, Nishinomiya, Hyōgo Prefecture 663-8152, Japan","Yokohamakoen, Naka Ward, Yokohama, Kanagawa Prefecture 231-0022, Japan","1 Chome-3-61 Koraku, Bunkyō, Tokyo 112-0004, Japan","1 Chome-1-1 Daikominami, Higashi Ward, Nagoya, Aichi Prefecture 461-0047, Japan","3-1 Kasumigaokamachi, Shinjuku, Tokyo 160-0013, Japan"]
        self.city = ["Hiroshima", "Nishinomiya","Yokohama","Tokyo","Nagoya","Shinjuku"]
        self.identifier = "centralLeaguePrototype"
        self.images = [ UIImage(named: "toyocarps")!, UIImage(named: "tigers")!,UIImage(named: "baystars")!,UIImage(named: "giants")!,UIImage(named: "dragons")!,UIImage(named: "swallos")!]
    
        self.colors = [UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0), .white,UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0),.white,UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0), .white]
        
        self.latitudes = [34.392126,34.721577,35.443564,35.705840,35.186723,35.674789]
        self.longitudes = [132.484640,135.361593,139.640040,139.751913,136.946950,139.717049]
    }
    
}
