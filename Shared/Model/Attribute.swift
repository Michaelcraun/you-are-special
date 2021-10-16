//
//  Attribute.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

class Attribute: Codable {
    let maxRank: Int
    let name: String
    
    var rank: Int?
    
    var image: String { name.lowercased() }
    
    init(name: String, maxRank: Int) {
        self.maxRank = maxRank
        self.name = name
    }
}

extension Array where Element == Attribute {
    subscript(_ special: SPECIAL) -> Attribute {
        print(special, self)
        return first(where: { $0.name.lowercased() == special.rawValue })!
    }
}

enum SPECIAL: String, CaseIterable, Codable {
    case strength
    case perception
    case endurance
    case charisma
    case intelligence
    case agility
    case luck
}
