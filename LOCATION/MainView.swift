//
//  MainView.swift
//  LOCATION
//
//  Created by Rita Marrano on 19/04/23.
//

import SwiftUI
import MapKit
import Combine
struct MainView: View {
    
    @State var landmarks: [Landmark] = [Landmark]()
    
    @ObservedObject var lm = LocationManager()
    @State private var search: String = ""
    @State private var tapped: Bool = false
//    @State private var region = MKCoordinateRegion.defaultRegion
//    @State private var cancellable: AnyCancellable?
    
    private func getNearByLandmarks(){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start{ (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                
                self.landmarks = mapItems.map{
                    Landmark(placemark: $0.placemark)
                }
            }
            
        }
        
    }
    
    
//    func setCurrentLocation(){
//        cancellable = lm.$userLocation.sink{ location in
//            region = MKCoordinateRegion(center: lm.userLocation?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 500, longitudinalMeters: 500)
//        }
//    }
    
    
    func calculateOffset() ->CGFloat{
        if self.landmarks.count > 0 && !self.tapped{
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
        
    }
    
    var body: some View {
        
        ZStack(alignment: .top){
            
            
            MapView(landmarks: landmarks)
            
            TextField("   Search", text: $search, onEditingChanged: {_ in})
            {
                self.getNearByLandmarks()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 2.0)))
            .padding()
            
            
            PlaceListView(landmarks: self.landmarks){
                self.tapped.toggle()
            }
            .animation(.spring())
            .offset(y: calculateOffset() )
//            .frame(width: 300.0, height: 40.0)
//            .border(.green, width: 4)
//            .cornerRadius(14)
//            .padding()
//            .offset(y: 44)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
