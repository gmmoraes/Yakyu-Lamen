//
//  LeagueMapController.swift
//  Yakyu Ramen
//
//  Created by Gabriel on 1/2/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation
class LeagueMapController {
    
    static let sharedInstance = LeagueMapController()
    
    var myIndex = 0
    var teamArray = [String]()
    var address = ""
    var latitudeChosen = Double()
    var longitudeChosen = Double()
    var teamChosen = ""
    
    private init(){}
}

