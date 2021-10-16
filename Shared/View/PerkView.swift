//
//  PerkView.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import SwiftUI

struct PerkView: View {
    let perk: Perk
    
    var body: some View {
        
        Image(perk.image)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 35, minHeight: 35)
            .onTapGesture {
                // show dialog for perk
            }
        
    }
}

struct PerkView_Previews: PreviewProvider {
    static var previews: some View {
        PerkView(perk: Perk(special: .charisma, requiredSpecial: 4, name: "Animal Friend", version: Fallout4.game.version, maxRank: 5, progression: []))
    }
}
