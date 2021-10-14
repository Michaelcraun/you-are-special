//
//  Attribute.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

class Attribute: Perk {
    
}

extension Array where Element == Attribute {
    subscript(_ special: SPECIAL) -> Attribute {
        return first(where: { $0.name.lowercased() == special.rawValue })!
    }
}

enum SPECIAL: String, Codable {
    case strength
    case perception
    case endurance
    case charisma
    case intelligence
    case agility
    case luck
}
