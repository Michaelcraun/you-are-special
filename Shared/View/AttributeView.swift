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
            
            Image(attribute.image)
                .resizable()
                .scaledToFit()
            
            Text(attribute.name)
            
        }
    }
}

struct AttributeView_Previews: PreviewProvider {
    static var previews: some View {
        AttributeView(attribute: Attribute(name: "Strength", version: Fallout4.game.version, maxRank: 10))
    }
}
