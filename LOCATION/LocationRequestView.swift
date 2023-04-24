//
//  LocationRequestView.swift
//  LOCATION
//
//  Created by Rita Marrano on 18/04/23.
//

import SwiftUI

struct LocationRequestView: View {
    

    
    var body: some View {
        ZStack{
            
            Color(.systemCyan).ignoresSafeArea()
            
            VStack{
                 Spacer()
                Image(systemName: "paperplane")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 30)
                
                Text("Explore nearby")
                    .font(.system(size: 28,weight: .heavy))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                VStack{
                    
                    Button {
                        LocationManager.shared.requestLocation()
                    } label: {
                        Text("Allow location")
                            .padding()
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .frame(width: 236)
                    .padding(.horizontal)
                    .background(Color.black)
                    .clipShape(Capsule())
                    .padding()
                    
                    
                    
                    Button {
                        print("loc")
                    } label: {
                        Text("Maybe later")
                            .padding()
                            .font(.title2)
                            .foregroundColor(.white)
                    }

                }
            }
            
        }
    }
}

struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView()
    }
}
