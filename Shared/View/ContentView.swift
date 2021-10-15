//
//  ContentView.swift
//  Shared
//
//  Created by Michael Craun on 10/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            SPECIALHeaderView()
            
            HStack {
                
                ForEach(viewModel.perkChart, id: \.attribute.name) { attributeList in
                    
                    VStack {
                        
                        Image(attributeList.attribute.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 35, maxHeight: 35)
                            .clipped()
                            .onTapGesture {
                                // Show dialog for attribute
                            }
                        
                        ForEach(attributeList.perks, id: \.name) { perk in
                            
                            Image(perk.image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 35, maxHeight: 35)
                                .onTapGesture {
                                    // Show dialog for perk
                                }
                            
                        }
                        
                        Spacer()
                        
                    }
                    
                }
                
            }
            
            Spacer()
            
        }
        .padding()
        .task {
//            await viewModel.setup()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
