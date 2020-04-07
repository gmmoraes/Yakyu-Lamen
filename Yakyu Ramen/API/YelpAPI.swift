//
//  YelpAPI.swift
//  Yakyu Ramen
//
//  Created by Gabriel on 12/15/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//
//
//import Foundation
//import Siesta
//
//class YelpAPI {
//    static let sharedInstance = YelpAPI()
//    
//    // 1 
//    private let service = Service(baseURL: "https://api.yelp.com/v3", standardTransformers: [.text, .image])
//    
//    private init() {
//        
//        let jsonDecoder = JSONDecoder()
//        
//        service.configureTransformer("/businesses/search") {
//            try jsonDecoder.decode(SearchResults<Restaurant>.self, from: $0.content).businesses
//        }
//
//        
//        // 2
//        SiestaLog.Category.enabled = [.network, .pipeline, .observers]
//        
//        service.configure("**") {
//            
//            // 3
//            $0.headers["Authorization"] =
//            "Bearer uyLqdyV33s7KBJ4IPy89H9f2b3p3XpnDkRXy0ybJlAlaPSe_7Pd2JLgtT-NV-Lh4RnLwyv-XEfEGE3IJL_qlAAEeuosPEq93DSdCmwtBS7CjWNSH9ZqviYjIixwMXHYx"
//            
//            // 4
//            $0.expirationTime = 60 * 60 // 60s * 60m = 1 hour
//        }
//    }
//    
//    func restaurantList(for location: String) -> Resource {
//        return service
//            .resource("/businesses/search")
//            .withParam("term", "ramen")
//            .withParam("location", location)
//            .withParam("limit", "50")
//    }
//
//    
//}
//
//
