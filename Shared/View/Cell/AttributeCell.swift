//
//  AttributeView.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import SwiftUI

struct AttributeCell: View {
    let attribute: Attribute
    
    var body: some View {
        
        VStack {
            
            Text(String(attribute.name.first!))
                .font(.largeTitle)
                .frame(minWidth: 35,
                       maxWidth: 50,
                       minHeight: 35,
                       maxHeight: 50)
            
            FirebaseImage(paths: attribute.imagePaths)
                .scaledToFit()
                .frame(minWidth: 35,
                       maxWidth: 50,
                       minHeight: 35,
                       maxHeight: 50)
                .onTapGesture {
                    // Show dialog for attribute
                }
            
        }
        .frame(alignment: .center)
        
    }
    
}

struct AttributeCell_Previews: PreviewProvider {
    static var previews: some View {
        AttributeCell(attribute: Attribute(
            name: "Strength",
            maxRank: 10,
            version: "fo4"))
    }
}
