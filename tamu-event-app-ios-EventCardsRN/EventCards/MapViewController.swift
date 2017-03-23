//
//  MapViewController.swift
//  EventCards
//
//  Created by Riley Norris on 3/6/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    
    //This file controls our map tab
    
    
    
    //Outlets and variables we need for later
    @IBOutlet weak var mapView: MKMapView!
    let address = ["Texas A&M University","607 Texas Ave S College Station, TX  77840","711 Texas Ave S College Station, TX  77840"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For in loop creates annotations on the map for every value in the address variable
        for address2 in address{
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(address2) { (placemarks, error) in
                if let placemarks = placemarks {
                    if placemarks.count != 0 {
                        let annotation = MKPlacemark(placemark: placemarks.first!)
                    
                        var region = MKCoordinateRegion()
                        region.span.latitudeDelta = 0.1;
                        region.span.longitudeDelta = 0.1;
                        region.center.latitude = annotation.coordinate.latitude
                        region.center.longitude = annotation.coordinate.longitude
                    
                        self.mapView.addAnnotation(annotation)
                        self.mapView.setRegion(region, animated: true)
                    }
                }
            }
        }

    }
}
