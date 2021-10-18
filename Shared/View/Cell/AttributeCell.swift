//
//  AttributeView.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import SwiftUI

struct AttributeCell: View {
    let attribute: Attribute
    @Binding var selected: Attribute?
    
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
                    selected = attribute
                }
            
        }
        .frame(alignment: .center)
        
    }
    
}

struct AttributeCell_Previews: PreviewProvider {
    static var previews: some View {
        AttributeCell(attribute: Attribute(),
                      selected: .constant(nil))
    }
}
