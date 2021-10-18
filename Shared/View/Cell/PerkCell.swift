//
//  PerkView.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import SwiftUI

struct PerkCell: View {
    let perk: Perk
    
    var body: some View {
        
        FirebaseImage(paths: perk.imagePaths)
            .scaledToFit()
            .frame(minWidth: 35,
                   maxWidth: 50,
                   minHeight: 35,
                   maxHeight: 50)
            .onTapGesture {
                // show dialog for perk
            }
        
    }
}

struct PerkCell_Previews: PreviewProvider {
    static var previews: some View {
        PerkCell(perk: Perk(special: .charisma, requiredSpecial: 4, name: "Animal Friend", version: "fo4", maxRank: 5, progression: []))
    }
}