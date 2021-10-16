//
//  Perk.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

class Perk: Codable {
    let maxRank: Int
    let name: String
    let progression: [Progression]?
    var requiredSpecial: Int
    let special: SPECIAL
    
    var rank: Int?
    
    var image: String { name.lowercased() }
    
    init(special: SPECIAL, requiredSpecial: Int, name: String, version: Version, maxRank: Int, progression: [Progression]) {
        self.maxRank = maxRank
        self.name = name
        self.progression = progression
        self.requiredSpecial = requiredSpecial
        self.special = special
    }
}

extension Perk {
    struct Progression: Codable {
        var description: String
        var rank: Int
        var requiredLevel: Int
    }
}
