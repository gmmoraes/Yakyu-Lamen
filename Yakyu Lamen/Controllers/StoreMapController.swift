//
//  StoreMapController.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 1/2/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation

class StoreMapController {
    
    static let sharedInstance = StoreMapController()
    
    var latitudeYelpChosen = Double()
    var longitudeYelpChosen = Double()
    var storeNameYelpChosen = ""
    
    private init(){}
}
