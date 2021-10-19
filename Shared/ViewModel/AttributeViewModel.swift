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
        
        self._rank = Binding<Int>.init(
            get: {
                return attribute.rank ?? 0
            }, set: { newValue in
                attribute.rank = newValue
            })
    }
}
