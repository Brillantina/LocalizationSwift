//
//  ContentView.swift
//  LOCATION
//
//  Created by Rita Marrano on 18/04/23.
//

import SwiftUI
import CoreData
import Combine
import MapKit


struct ContentView: View {
    
    @ObservedObject var lm = LocationManager.shared
    
    var body: some View {
        
        Group{
            
            if lm.userLocation == nil {
                LocationRequestView()
            } else {
                MainView()
               
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
