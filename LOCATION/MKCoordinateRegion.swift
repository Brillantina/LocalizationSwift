//
//  MKCoordinateRegion.swift
//  LOCATION
//
//  Created by Rita Marrano on 19/04/23.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    static var defaultRegion: MKCoordinateRegion{
        MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 40.8518, longitude: 14.2681), latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}
