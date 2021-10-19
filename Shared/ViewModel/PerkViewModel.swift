//
//  PerkViewModel.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/18/21.
//

import Foundation

class PerkViewModel: ObservableObject {
    @Published var perk: Perk
    
    init(perk: Perk) {
        self.perk = perk
    }
}
