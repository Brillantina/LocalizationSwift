//
//  LandmarkAnnotation.swift
//  LOCATION
//
//  Created by Rita Marrano on 19/04/23.
//

import Foundation
import UIKit
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(landmark:Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
