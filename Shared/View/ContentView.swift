//
//  ContentView.swift
//  Shared
//
//  Created by Michael Craun on 10/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var perkChart = Fallout4.game.version.perkChart()
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            SPECIALHeaderView()
            
            HStack {
                
                ForEach(perkChart, id: \.attribute.name) { attributeList in
                    
                    VStack {
                        
                        Image(attributeList.attribute.image)
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                // Show dialog for attribute
                            }
                        
                        ForEach(attributeList.perks, id: \.name) { perk in
                            
                            Image(perk.image)
                                .resizable()
                                .scaledToFit()
                                .onTapGesture {
                                    // Show dialog for perk
                                }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            Spacer()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
