//
//  SPECIALHeaderView.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import SwiftUI

struct SPECIALHeaderView: View {
    private let special = ["S", "P", "E", "C", "I", "A", "L"]
    
    var body: some View {
        
        VStack {
            
            Text("YOU ARE")
                .font(.title3)
            
            HStack {
                
                Spacer()
                
                ForEach(special, id: \.self) { char in
                    
                    Text(char)
                        .font(.largeTitle)
                        .frame(maxWidth: 35, maxHeight: 35)
                    
                    Spacer()
                    
                }
                
            }
            .font(.largeTitle)
            
        }
        
    }
    
}

struct SPECIALHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SPECIALHeaderView()
    }
}
