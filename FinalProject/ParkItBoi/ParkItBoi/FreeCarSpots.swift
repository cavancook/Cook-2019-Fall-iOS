//
//  FreeCarSpots.swift
//  ParkItBoi
//
//  Created by Cavan Cook on 12/5/19.
//  Copyright © 2019 Cavan Cook. All rights reserved.
//

import Foundation
import MapKit

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
}
