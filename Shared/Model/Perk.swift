//
//  Perk.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

class Perk: Codable {
    var special: SPECIAL?
    var maxRank: Int
    var name: String
    var progression: [Progression]?
    var version: Version
    
    // Example: "fo4_strength"
    var attribute: Attribute? {
        if let special = special {
            return version.perks.compactMap({ $0 as? Attribute })[special]
        }
        return nil
    }
    var image: String { "\(version.id)_\(name)".lowercased() }
    var rank: Int = 0
    var requiredSpecial: Int = 0
    
    init(name: String, version: Version, maxRank: Int) {
        self.maxRank = maxRank
        self.name = name
        self.version = version
    }
    
    convenience init(special: SPECIAL, requiredSpecial: Int, name: String, version: Version, maxRank: Int, progression: [Progression]) {
        self.init(name: name, version: version, maxRank: maxRank)
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
