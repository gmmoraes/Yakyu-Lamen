//
//  Restaurant.swift
//  Yakyu Ramen
//
//  Created by Gabriel on 12/21/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    let id: String
    let name: String
    let imageUrl: String
    let rating: Double
    let distance: Double
    let coordinates: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image_url"
        case rating
        case distance
        case coordinates
    }
    
}

struct SearchResults<T: Decodable>: Decodable {
    let businesses: [T]
}
