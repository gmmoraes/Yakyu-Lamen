//
//  MapViewController.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 12/30/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController,  MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        let sourceLocation = CLLocationCoordinate2D(latitude: LeagueMapController.sharedInstance.latitudeChosen, longitude: LeagueMapController.sharedInstance.longitudeChosen)
        let destinationLocation = CLLocationCoordinate2D(latitude: StoreMapController.sharedInstance.latitudeYelpChosen, longitude: StoreMapController.sharedInstance.longitudeYelpChosen)
        
        // 3.
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        // 4.
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        // 5.
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = LeagueMapController.sharedInstance.teamChosen
        
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = StoreMapController.sharedInstance.storeNameYelpChosen
        
        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        // 6.
        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
        
        // 7.
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .walking
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        // 8.
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.mapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        
        return renderer
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isMember(of: MKUserLocation.self) {
            return nil
        }
        let pinid = "Yakyu_Lamen.MapPoints"
        
        if annotation.title! == LeagueMapController.sharedInstance.teamChosen {
            let reuseId = "Yakyu_Lamen.MapPoints"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
            if pinView == nil {
                pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: pinid)}
            pinView!.canShowCallout = true
            pinView!.image = UIImage(named: "stadium2")
            
            return pinView
        } else {
            let reuseId = "Yakyu_Lamen.StadiumAnnotation"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
            if pinView == nil {
                pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: pinid)}
            pinView!.canShowCallout = true
            pinView!.image = UIImage(named: "ramen2")
            
            return pinView
        }
    }
    
    
}





