//
//  MapPoints.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 12/30/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import MapKit
import UIKit

class MapPoints: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
