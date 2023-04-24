//
//  MapView.swift
//  LOCATION
//
//  Created by Rita Marrano on 19/04/23.
//

import Foundation
import SwiftUI
import MapKit
import Combine

class Coordinator: NSObject, MKMapViewDelegate {
    
    var control : MapView
    @ObservedObject var lm = LocationManager()
    @State private var region : MKCoordinateRegion?
    @State private var cancellable: AnyCancellable?
    
    
    init(_ control: MapView) {
        self.control = control
    }
    

    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
    
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
//                     let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.8518 ,longitude: 14.2681), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
//
//
//                    cancellable = lm.$userLocation.sink{ location in
                        self.region = MKCoordinateRegion(center: self.lm.userLocation?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 500, longitudinalMeters: 500)
                   // }
                    
//                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
                        
                    mapView.setRegion(region ?? MKCoordinateRegion(), animated: true)
                }
            }
        }
    }
}


struct MapView: UIViewRepresentable {
    
    let landmarks: [Landmark]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView){
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}
