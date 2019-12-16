//
//  FreeCarSpotView.swift
//  ParkItBoi
//
//  Created by Cavan Cook on 12/10/19.
//  Copyright © 2019 Cavan Cook. All rights reserved.
//

import Foundation
import MapKit

class FreeCarSpotsView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      // 1
      guard let freeCarSpots = newValue as? FreeCarSpots else { return }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
      // 2
      markerTintColor = freeCarSpots.markerTintColor
      //glyphText = String(freeCarSpots.discipline.first!)
        if let imageName = freeCarSpots.imageName {
          glyphImage = UIImage(named: imageName)
        } else {
          glyphImage = nil
        }
    }
  }
}
class FreeCarSpotsImageView: MKAnnotationView {
    override var annotation: MKAnnotation? {
      willSet {
        guard let freeCar = newValue as? FreeCarSpots else {return}
        canShowCallout = true
        calloutOffset = CGPoint(x: -5, y: 5)
        rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

        if let imageName = freeCar.imageName {
          image = UIImage(named: imageName)
        } else {
          image = nil
        }
      }
    }
  }

