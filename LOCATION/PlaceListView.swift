//
//  PlaceListView.swift
//  LOCATION
//
//  Created by Rita Marrano on 19/04/23.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    
    let landmarks: [Landmark]
    
    var onTap: () -> ()
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                EmptyView()
            }
            .frame(width: UIScreen.main.bounds.width, height: 60)
            .background(Color.gray)
            .gesture(TapGesture()
                .onEnded(self.onTap))
            
            
            
            List {
                ForEach(self.landmarks, id: \.id) { landmark in
                    
                    Group{
                        
//                        /*@START_MENU_TOKEN@*/Text(landmark.name)/*@END_MENU_TOKEN@*/
//                            .fontWeight(.bold)
//
//                        Text(landmark.title)
                        CardListView(lands: landmark)
                            
                    }
                }
            }
            .animation(nil)
        }
        .cornerRadius(10)
    }
}

//struct PlaceListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceListView()
//    }
//}
