//
//  StadiumAnnotation.swift
//  Yakyu Lamen
//
//  Created by Rafael on 1/1/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit
import MapKit

class StadiumAnnotation: NSObject, MKAnnotation {
    
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate = CLLocationCoordinate2D(latitude: latitudeChosen, longitude: longitudeChosen)
    
    // Required if you set the annotation view's `canShowCallout` property to `true`
    var title: String? = NSLocalizedString(teamChosen, comment: "SF annotation")
    
    // This property defined by `MKAnnotation` is not required.
    var subtitle: String? = NSLocalizedString(teamChosen, comment: "SF annotation")
}
