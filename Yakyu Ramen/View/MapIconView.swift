//
//  mapView.swift
//  Yakyu Ramen
//
//  Created by Gabriel on 12/31/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import Foundation
import MapKit

class MapIconView: MKAnnotationView {

    override var annotation: MKAnnotation? {
        willSet {
            guard let annotation = newValue else {return}
            switch annotation {
            case is MapIconView:
                self.canShowCallout = true
                self.image = UIImage(named: "stadium2")
                self.centerOffset = CGPoint(x: 0, y: -self.image!.size.height / 2)
                break
            default:
                return
            }
            //self.setAnimationLayer()
        }
    }
    
    /**func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? { return nil }
    guard !(annotation is MKUserLocation) else {
    let annotationIdentifier = "Identifier"
    if let myAnnotation = annotation as? myCustomMKAnnotation {
    let annotation = myCustomAnnotationView(annotation: siteAnnotation, reuseIdentifier: annotationIdentifier)
    return annotation
    }
    return nil
    }*/
}
