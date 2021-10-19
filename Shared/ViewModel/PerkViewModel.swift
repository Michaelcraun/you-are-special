//
//  PerkViewModel.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/18/21.
//

import SwiftUI

class PerkViewModel: ObservableObject {
    @Published var perk: Perk = Perk()
    @Published var description: String
    @Published var name: String
    @Binding var rank: Int
    
    var imagePaths: [String]
    var maxRank: Int
    
    init(perk: Perk) {
        self.perk = perk
        
        self.description = perk.description
        self.imagePaths = perk.imagePaths
        self.name = perk.name
        self.maxRank = perk.maxRank
        self._rank = .init(get: { 0 }, set: { _ in })
        self._rank = .init(
            get: {
                return self.perk.rank ?? 0
            }, set: { newValue in
                self.perk.rank = newValue
                self.description = self.perk.description
            })
    }
    
    
}
