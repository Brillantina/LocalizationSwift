//
//  CardListView.swift
//  LOCATION
//
//  Created by Rita Marrano on 20/04/23.
//

import SwiftUI

struct CardListView: View {
    
    var lands: Landmark?
    
    var body: some View {
        
        
        ZStack(alignment: .topLeading){
            
            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(.blue)

            
                
                VStack(alignment: .leading){
                    
                    Text(lands?.name ?? "")
                        .font(.largeTitle)
                    
                    
                    
                    Text(lands?.title ?? "")
                        .font(.headline)
                    
                
            }
                .padding()
                .scaledToFit()
                .scaledToFill()
                .multilineTextAlignment(.leading)
            
        }
        .frame(width: 400, height: 100)
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}
