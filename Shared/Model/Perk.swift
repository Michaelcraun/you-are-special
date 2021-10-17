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
    let version: String
    
    var rank: Int?
    
    var imagePaths: [String] {
        if name.contains("/") {
            let perkNames = name.components(separatedBy: "/")
            return perkNames.map { "\(version)/\($0.lowercased())" }
        } else {
            return ["\(version)/\(name.lowercased())"]
        }
    }
    var localImageName: String { name.lowercased() }
    
    init(special: SPECIAL, requiredSpecial: Int, name: String, version: String, maxRank: Int, progression: [Progression]) {
        self.maxRank = maxRank
        self.name = name
        self.progression = progression
        self.requiredSpecial = requiredSpecial
        self.special = special
        self.version = version
    }
}

extension Perk {
    struct Progression: Codable {
        var description: String
        var rank: Int
        var requiredLevel: Int
    }
}
