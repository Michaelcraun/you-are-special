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
        [Attribute(name: "Strength", maxRank: 10, version: "fo4"),
         Attribute(name: "Perception", maxRank: 10, version: "fo4"),
         Attribute(name: "Endurance", maxRank: 10, version: "fo4"),
         Attribute(name: "Charisma", maxRank: 10, version: "fo4"),
         Attribute(name: "Intelligence", maxRank: 10, version: "fo4"),
         Attribute(name: "Agility", maxRank: 10, version: "fo4"),
         Attribute(name: "Luck", maxRank: 10, version: "fo4")]
    }
    private var perks: [Perk] {
        return [
            Perk(
                special: .agility,
                requiredSpecial: 5,
                name: "Action Girl",
                version: "fo4",
                maxRank: 2,
                progression: [
                    Perk.Progression(
                        description: "There's no time to waste! Action Points regenerate 25% faster.",
                        rank: 1,
                        requiredLevel: 1),
                    Perk.Progression(
                        description: "Your Action Points now regenerate 50% faster.",
                        rank: 2,
                        requiredLevel: 18)
                ]),
            Perk(
                special: .endurance,
                requiredSpecial: 5,
                name: "Aquagirl",
                version: "fo4",
                maxRank: 2,
                progression: [
                    Perk.Progression(
                        description: "Water is your ally. You no longer take radiation damage from swimming, and can breathe underwater.",
                        rank: 1,
                        requiredLevel: 1),
                    Perk.Progression(
                        description: "You become totally undetectable while submerged.",
                        rank: 2,
                        requiredLevel: 21)
                ]),
            Perk(
                special: .charisma,
                requiredSpecial: 5,
                name: "Animal Friend",
                version: "fo4",
                maxRank: 3,
                progression: [
                    .init(
                        description: "Commune with beasts! With your gun, aim at any animal below your level and gain a chance to pacify it.",
                        rank: 1,
                        requiredLevel: 1),
                    .init(
                        description: "When you successfully pacify an animal, you can incite it to attack",
                        rank: 2,
                        requiredLevel: 12),
                    .init(
                        description: "When you successfully pacify an animal, you can give it specific commands",
                        rank: 3,
                        requiredLevel: 28)
                ]),
            Perk(
                special: .charisma,
                requiredSpecial: 7,
                name: "Party Girl",
                version: "fo4",
                maxRank: 3,
                progression: [
                    .init(
                        description: "Nobody has a good time like you! There's no chance you'll get addicted to alcohol.",
                        rank: 1,
                        requiredLevel: 1),
                    .init(
                        description: "The effects of alcohol are doubled.",
                        rank: 2,
                        requiredLevel: 15),
                    .init(
                        description: "Your Luck is increased by 3 while you're under the influence of alcohol.",
                        rank: 3,
                        requiredLevel: 37)
                ]),
            Perk(
                special: .perception,
                requiredSpecial: 9,
                name: "Penetrator",
                version: "fo4",
                maxRank: 2,
                progression: [
                    .init(
                        description: "There's no place to hide! In V.A.T.S you can target an enemy's body parts that are blocked by cover, with a decrease in accuracy.",
                        rank: 1,
                        requiredLevel: 1),
                    .init(
                        description: "In V.A.T.S when you target an enemy's body parts that are blocked by cover, there is no decrease in accuracy.",
                        rank: 2,
                        requiredLevel: 28)
                ])
            ]
    }
    
    init() {
        version = Version(id: "fo4", name: "Fallout 4")
        version.attributes = attributes
        version.perks = perks
    }
}
