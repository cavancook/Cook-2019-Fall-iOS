//
//  FreeCarSpots.swift
//  ParkItBoi
//
//  Created by Cavan Cook on 12/5/19.
//  Copyright © 2019 Cavan Cook. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class FreeCarSpots: NSObject, MKAnnotation {
  let title: String?
  let locationName: String
  let discipline: String
  let coordinate: CLLocationCoordinate2D
  
  init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate
    
    super.init()
  }
  
  var subtitle: String? {
    return locationName
  }
    // Annotation right callout accessory opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
      let addressDict = [CNPostalAddressStreetKey: subtitle!]
      let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = title
      return mapItem
    }

    var markerTintColor: UIColor  {
      switch discipline {
      case "Car":
        return .red
      case "Motorcycle":
        return .cyan
      case "Bike":
        return .blue
      default:
        return .green
      }
    }
    var imageName: String? {
        if discipline == "Motorcycle" { return "Motorcycle" }
        if discipline == "Bike" { return "Bike" }
        return "Car"
    }
}


