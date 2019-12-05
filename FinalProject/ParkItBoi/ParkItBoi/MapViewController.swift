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
        
        // show spot on map
        let freeCarSpots = FreeCarSpots(title: "13th and Jefferson",
          locationName: "13th and Jefferson",
          discipline: "Free Street Parking",
          coordinate: CLLocationCoordinate2D(latitude: 43.620433, longitude: -116.206396))
        mapView.addAnnotation(freeCarSpots)
        
        let freeCarSpots2 = FreeCarSpots(title: "Post Office",
          locationName: "Post Office",
          discipline: "Free Street Parking",
          coordinate: CLLocationCoordinate2D(latitude: 43.614677, longitude: -116.215851))
        mapView.addAnnotation(freeCarSpots2)

    }
}
extension MapViewController: MKMapViewDelegate {
    func mapViewWillStartRenderingMap(_ mapView: MKMapView){
       print("rendering ...")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
      // 2
      guard let annotation = annotation as? FreeCarSpots else { return nil }
      // 3
      let identifier = "marker"
      var view: MKMarkerAnnotationView
      // 4
      if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        as? MKMarkerAnnotationView {
        dequeuedView.annotation = annotation
        view = dequeuedView
      } else {
        // 5
        view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: -5, y: 5)
        view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
      }
      return view
    }
}

