//
//  PacificLeagueDataSource.swift
//  Yakyu Ramen
//
//  Created by Gabriel on 1/3/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation
import UIKit

class PacificLeagueDataSource: DataSource {
    override init() {
        super.init()
        self.teams = ["SoftBank Hawks", "Seibu Lions", "Rakuten G. Eagles", "ORIX Buffaloes", "Nippon-Ham F.", "Lotte Marines"]
        self.address = ["2 Chome-2-2 Jigyohama, Chuo , Fukuoka, Fukuoka Prefecture 810-8660, Japan", "2135 Kami-Yamaguchi, Tokorozawa City, Saitama","2 Chome-11-6 Miyagino, Miyagino Ward, Sendai, Miyagi Prefecture 983-0045, Japan","京セラドーム大阪, Japão, 〒550-0023 Ōsaka-fu, Ōsaka-shi, Nishi-ku, Chiyozaki, 3 Chome−中２−1","1 Hitsujigaoka, Toyohira Ward, Sapporo, Hokkaido 062-0045, Japan","1 Mihama, Mihama Ward, Chiba, Chiba Prefecture 261-0022, Japan"]
        self.city = ["Fukuoka", "Tokorozawa", "Sendai", "Osaka", "Sapporo","Chiba"]
        self.identifier = "pacificLeaguePrototype"
        self.images =  [ UIImage(named: "hawks")!, UIImage(named: "seibu")!,UIImage(named: "eagles")!,UIImage(named: "buffalos")!,UIImage(named: "nipponham")!,UIImage(named: "marines")!]
        
        self.colors = [UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0), .white,UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0),.white,UIColor(red: 240/255, green: 240/255, blue: 240/255,  alpha: 2.0), .white]
        
        self.latitudes = [33.595629,35.768620,38.256594,34.669796,43.016844,35.645466]
        self.longitudes = [130.362227,139.420546,140.902580,135.476039,141.411246,140.030920]
    }
    
}
