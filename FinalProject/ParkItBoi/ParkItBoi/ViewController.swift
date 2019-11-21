//
//  ViewController.swift
//  ParkItBoi
//
//  Created by Cavan Cook on 11/19/19.
//  Copyright © 2019 Cavan Cook. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
           func centerMapOnLocation(location: CLLocation) {
             let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
               regionRadius, regionRadius)
             mapView.setRegion(coordinateRegion, animated: true)
           }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
       
        centerMapOnLocation(location: initialLocation)
  }

}


