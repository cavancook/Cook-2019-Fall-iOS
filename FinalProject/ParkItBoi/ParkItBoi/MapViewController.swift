//
//  MapViewController.swift
//  ParkItBoi
//
//  Created by Cavan Cook on 12/3/19.
//  Copyright © 2019 Cavan Cook. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else {
            mapView.mapType = .satellite
        }
        
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let boise = CLLocation(latitude: 43.6150, longitude:-116.2023)
        let regionRadius: CLLocationDistance = 1000
        let region = MKCoordinateRegion(center: boise.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
    }
}
extension MapViewController: MKMapViewDelegate {
    func mapViewWillStartRenderingMap(_ mapView: MKMapView){
       print("rendering ...")
    }
}
