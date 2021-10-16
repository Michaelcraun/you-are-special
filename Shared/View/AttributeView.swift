//
//  AttributeView.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import SwiftUI

struct AttributeView: View {
    let attribute: Attribute
    
    var body: some View {
        
        VStack {
            
            Text(String(attribute.name.first!))
                .font(.largeTitle)
                .frame(minWidth: 35, minHeight: 35)
            
            Image(attribute.image)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 35, minHeight: 35)
                .onTapGesture {
                    // Show dialog for attribute
                }
            
        }
        .frame(alignment: .center)
        
    }
    
}

struct AttributeView_Previews: PreviewProvider {
    static var previews: some View {
        AttributeView(attribute: Attribute(name: "Strength", maxRank: 10))
    }
}
