//
//  Fallout4.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

struct Fallout4 {
    static let game = Fallout4()
    
    var version: Version
    private var attributes: [Attribute] {
        [Attribute(name: "Strength", version: version, maxRank: 10),
         Attribute(name: "Perception", version: version, maxRank: 10),
         Attribute(name: "Endurance", version: version, maxRank: 10),
         Attribute(name: "Charisma", version: version, maxRank: 10),
         Attribute(name: "Intelligence", version: version, maxRank: 10),
         Attribute(name: "Agility", version: version, maxRank: 10),
         Attribute(name: "Luck", version: version, maxRank: 10)]
    }
    private var perks: [Perk] {
        return [
            Perk(
                special: .strength,
                requiredSpecial: 1,
                name: "Iron Fist",
                version: version,
                maxRank: 5,
                progression: [
                    Perk.Progression(
                        description: "Channel your chi to unleash devastating fury! Punching attacks do 20% more damage to your opponent.",
                        rank: 1,
                        requiredLevel: 0),
                    Perk.Progression(
                        description: "Punching attacks now do 40% more damage and can disarm your opponent.",
                        rank: 2,
                        requiredLevel: 9),
                    Perk.Progression(
                        description: "Punching attacks now do 40% more damage and can disarm your opponent.Punching attacks now do 60% more damage. Unarmed Power Attacks have a chance to cripple one of your opponent's limbs.",
                        rank: 3,
                        requiredLevel: 18),
                    Perk.Progression(
                        description: "Punching attacks now do 60% more damage. Unarmed Power Attacks have a chance to cripple one of your opponent's limbs.Punching attacks now do 80% more damage. Unarmed Power Attacks have an increased chance to cripple one of your opponent's limbs.",
                        rank: 4,
                        requiredLevel: 31),
                    Perk.Progression(
                        description: "Punching attacks now do double damage. Criticals in V.A.T.S. will paralyze your opponent.",
                        rank: 5,
                        requiredLevel: 46)
                ])]
    }
    
    init() {
        version = Version(id: "fo4", name: "Fallout 4")
        version.perks = attributes + perks
    }
}
