//
//  Attribute.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

class Attribute: Codable, Identifiable, Equatable {
    var description: String
    let maxRank: Int
    let name: String
    let version: String
    
    var id: String { "\(version)-\(name)"}
    var special: SPECIAL? { return SPECIAL(rawValue: name.lowercased()) }
    var rank: Int?
    
    var imagePaths: [String] {
        if name.contains("/") {
            let names = name.components(separatedBy: "/")
            return names.map { "\(version)/\($0.lowercased())" }
        } else {
            return ["\(version)/\(name.lowercased())"]
        }
    }
    var localImageName: String { name.lowercased() }
    
    init(name: String, description: String, maxRank: Int, version: String) {
        self.description = description
        self.maxRank = maxRank
        self.name = name
        self.version = version
    }
    
    convenience init() {
        self.init(name: "", description: "", maxRank: 0, version: "")
    }
    
    static func == (lhs: Attribute, rhs: Attribute) -> Bool {
        lhs.id == rhs.id
    }
}

extension Array where Element == Attribute {
    subscript(_ special: SPECIAL) -> Attribute {
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
