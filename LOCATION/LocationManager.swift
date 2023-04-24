//
//  LocationManager.swift
//  LOCATION
//
//  Created by Rita Marrano on 18/04/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    private let manager = CLLocationManager()
    @Published var userLocation : CLLocation? = nil
    static let shared = LocationManager()
    
    
     override init() {
        super.init()
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.manager.distanceFilter = kCLDistanceFilterNone
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }
    
    func requestLocation(){
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
//        switch status {
//        case .notDetermined:
//            print("DEBUG: not determined")
//        case .restricted:
//            print("DEBUG: restricted")
//        case .denied:
//            print("DEBUG: denied")
//        case .authorizedAlways:
//            print("DEBUG: always")
//        case .authorizedWhenInUse:
//            print("DEBUG: when in use")
//        @unknown default:
//            break
//        }
        print(status)
    }
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else {return}
//        self.userLocation = location
//    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        DispatchQueue.main.async{
            self.userLocation = location
        }
    }
}
