//
//  LocationController.swift
//  ParkItBoi
//
//  Created by Cavan Cook on 12/2/19.
//  Copyright © 2019 Cavan Cook. All rights reserved.
//

import UIKit
import CoreLocation

class LocationController: NSObject, CLLocationManagerDelegate {
    static var locationManager: CLLocationManager = CLLocationManager()
    
    static var locationController:LocationController = LocationController()
    
    static var currentLocation:CLLocation? = nil
    
    static func startMonitoringLocation(){
        locationManager.delegate = locationController
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.distanceFilter = 10
        
        locationManager.startUpdatingLocation()
    }
    
    static func stopMonitoringLocation(){
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        LocationController.currentLocation = locations.last
        
        NotificationCenter.default.post(name: NSNotification.Name("LOCATION_DID_UPDATE"), object: nil)
    }
}
