//
//  AttributeViewModel.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/18/21.
//

import SwiftUI

class AttributeViewModel: ObservableObject {
    @Published var attribute: Attribute
    @Published var description: String
    @Published var name: String
    @Published var perks: [PerkViewModel]
    @Binding var rank: Int
    
    var imagePaths: [String]
    var maxRank: Int
    
    init(attribute: Attribute, perks: [Perk]) {
        self.attribute = attribute
        
        self.description = attribute.description
        self.imagePaths = attribute.imagePaths
        self.maxRank = attribute.maxRank
        self.name = attribute.name
        self.perks = perks.filter({ $0.special == attribute.special })
            .sorted(by: { $0.requiredSpecial < $1.requiredSpecial })
            .map { PerkViewModel(perk: $0) }
        
        self._rank = .init(get: { Int.random(in: 11...20) }, set: { _ in })
        self._rank = .init(
            get: {
                print("rank is currently", self.attribute.rank ?? 0)
                return self.attribute.rank ?? 0
            }, set: { newValue in
                print("setting", newValue, "for", self.name)
                self.attribute.rank = newValue
                print(self.name, "is now", self.attribute.rank ?? 0)
            })
    }
}
