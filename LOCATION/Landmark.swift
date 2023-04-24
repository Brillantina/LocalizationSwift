//
//  Landmark.swift
//  LOCATION
//
//  Created by Rita Marrano on 19/04/23.
//

import Foundation
import SwiftUI
import MapKit

struct Landmark {
    
    let placemark: MKPlacemark
    
    var id: UUID{
        return UUID()
    }
    
    var name: String{
        self.placemark.name ?? ""
    }
    
    var title: String{
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate 
    }
    
    
}
