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
    
    var choice: String = "Cars"
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else if(sender.selectedSegmentIndex == 1){
            mapView.mapType = .satellite
        } else {
            mapView.mapType = .hybrid
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
        
        // show spots on map
        if (choice == "Motorcycles") {
            postMotoPins()
        } else if (choice == "Bikes"){
            postBikePins()
        } else if(choice == "Cars") {
        postCarPins()
        }
        mapView.register(FreeCarSpotsImageView.self,
        forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

    }
}
extension MapViewController: MKMapViewDelegate {
    func mapViewWillStartRenderingMap(_ mapView: MKMapView){
       print("rendering ...")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {
      let location = view.annotation as! FreeCarSpots
      let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
      location.mapItem().openInMaps(launchOptions: launchOptions)
    }

    
    func postCarPins(){
        createPin(title: "Free Street Parking", name: "Jefferson and 13th", type: "Car", locationLat: 43.620433, locationLong: -116.206396)
        createPin(title: "Free Street Parking", name: "Jefferson and 13th", type: "Car", locationLat: 43.614677, locationLong: -116.215851)
        createPin(title: "Free Park Parking", name: "Ann Morrison", type: "Car", locationLat: 43.606720, locationLong: -116.215627)
        createPin(title: "Free 2hr Street Parking", name: "Cradle Point North Side", type: "Car", locationLat: 43.619957, locationLong: -116.205462)
        createPin(title: "Free Street Parking", name: "Insurance garage East Side", type: "Car", locationLat: 43.620836, locationLong: -116.205612)
        createPin(title: "Free 2hr Street Parking", name: "Library!", type: "Car", locationLat: 43.610802, locationLong: -116.208010)
        createPin(title: "Free Street Parking", name: "Library!", type: "Car", locationLat: 43.610823, locationLong: -116.208231)
        createPin(title: "Free 2hr Street Parking", name: "Library!", type: "Car", locationLat: 43.610409, locationLong: -116.208613)
        createPin(title: "Free Street Parking", name: "Library!", type: "Car", locationLat: 43.610528, locationLong: -116.208279)
        createPin(title: "Free Park Parking", name: "Military Reserve", type: "Car", locationLat: 43.617114, locationLong: -116.186238)
        createPin(title: "Free 2hr Park Parking", name: "Julia Davis", type: "Car", locationLat: 43.607903, locationLong: -116.203626)
        createPin(title: "Free 2hr Park Parking", name: "Julia Davis", type: "Car", locationLat: 43.609362, locationLong: -116.203850)
        createPin(title: "Free 2hr Street Parking", name: "Craddle Point South Side", type: "Car", locationLat: 43.619254, locationLong: -116.206033)
        createPin(title: "Free Park Parking", name: "Camelsback", type: "Car", locationLat: 43.634034, locationLong: -116.202317)
        createPin(title: "Free 2hr Street Parking", name: "Boise Bike Project", type: "Car", locationLat: 43.608096, locationLong: -116.211863)
    }
    func postMotoPins(){
        createPin(title: "Free Motorcycle Parking", name: "Guru Donuts", type: "Motorcycle", locationLat: 43.616900, locationLong: -116.205707)
        createPin(title: "Free Motorcycle Parking", name: "Park BOI inside garage", type: "Motorcycle", locationLat: 43.616143, locationLong: -116.201633)
    }
    func postBikePins(){
        createPin(title: "Free Bike Parking", name: "Bus Station Hoops", type: "Bike", locationLat: 43.615212, locationLong: -116.202796)
        createPin(title: "Free Bike Parking", name: "8th Street Hoops", type: "Bike", locationLat: 43.616618, locationLong: -116.202633)
        createPin(title: "Free Bike Parking", name: "8th Street Hoops", type: "Bike", locationLat: 43.617036, locationLong: -116.201957)
        createPin(title: "Free Bike Parking", name: "8th Street Hoops", type: "Bike", locationLat: 43.616969, locationLong: -116.202099)
    }
    
    //Function to simplify creating pins
    func createPin(title: String, name: String, type: String, locationLat: Double, locationLong: Double){
        let pin = FreeCarSpots(title: title,
            locationName: name,
            discipline: type,
            coordinate: CLLocationCoordinate2D(latitude: locationLat, longitude: locationLong))
        mapView.addAnnotation(pin)
    }
}

