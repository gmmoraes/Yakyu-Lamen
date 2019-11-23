//
//  Restaurants.swift
//  Yakyu Lamen
//
//  Created by Rafael on 12/27/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import Foundation
import UIKit

class Restaurants {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    var location: String
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int, location: String) {
        
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0  {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        self.location = location
        
    }
    
}
