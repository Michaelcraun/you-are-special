//
//  ImportService.swift
//  you-are-special
//
//  Created by Michael Craun on 10/15/21.
//

import Foundation

struct Importer {
    static let service = Importer()
    
    private let special = ["Strength", "Perception", "Endurance", "Intelligence", "Agility", "Luck"]
    
    func readFileAt(location: URL) throws -> Version {
        let data = try Data(contentsOf: location)
        let version = try JSONDecoder().decode(Version.self, from: data)
        return version
    }
    
    /**
     * This function was created to confirm the following all result in true:
     * 1. The version has all 7 SPECIAL attributes contained within
     * 2. Each attribute contained within the imported version have the same number of perks associated with them
     * 3. No perk is repeated within a set of perks
     * 4. Each set of perks has a linear progression through its associated SPECIAL attribute (each set of perks'
     *   requiredSpecial advances from 1 to 10)
     * 5. Each perk has the correct number of progression items correspnding to its maxRanks property
     * 6. Each perk progression (when sorted by rank) has a linear progression for their requiredLevel property
     */
    func validate(version: Version) throws {
        let attributes = version.attributes()
        
        // Verify the version has exactly 7 attributes contained within
        guard attributes.count == 7 else { throw ImporterError.invalidAttributeCount }
        
        // Verify that the versions' attributes contain all SPECIAL attributes
        guard attributes.map({ $0.name }).contains(all: special) else {
            let missing = special.filter({ attributes.map({ $0.name }).contains($0) })
            let missingSPECIAL = missing.compactMap({ SPECIAL(rawValue: $0) })
            throw ImporterError.missingSPECIAL(missingSPECIAL)
        }
        
        // Verify each attribute's perks
        for attribute in attributes {
            guard let special = SPECIAL(rawValue: attribute.name.lowercased()) else { return }
            let perks = version.perksFor(special: special)
            
            // Verify that the number of perks is equal to this attribute's maxRanks
            guard perks.count == attribute.maxRank else { throw ImporterError.invalidPerkCountFor(special) }
            
            // Verify that the perks follow a linear progression through this attribute's possible ranks
            let perksSortedByRequredSpecial = perks.sorted(by: { $0.requiredSpecial < $1.requiredSpecial })
            let perkSpecials = perksSortedByRequredSpecial.map({ $0.requiredSpecial })
            let expectedSpecials = Array(1...attribute.maxRank)
            guard perkSpecials == expectedSpecials else { throw ImporterError.invalidPerkProgressionFor(special, perkSpecials) }
            
            // Verify each perk's progression
            for perk in perksSortedByRequredSpecial {
                // Verify that the perk has progression items
                guard let progression = perk.progression else { throw ImporterError.missingPerkProgressionFor(perk) }
                
                // Verify that the perk's progression has the same number of items as the perk has availabel ranks
                guard progression.count == perk.maxRank else { throw ImporterError.invalidPerkProgressionCountFor(perk) }
                
                // Verify linear progression of progression ranks
                let sortedProgression = progression.sorted(by: { $0.rank < $1.rank })
                let progressionRanks = sortedProgression.map({ $0.rank })
                let expectedRanks = Array(1...perk.maxRank)
                guard progressionRanks == expectedRanks else { throw ImporterError.invalidPerkProgressionRanksFor(perk, progressionRanks) }
                
                // Verify linear progression of progression required levels
                let requiredLevels = sortedProgression.map({ $0.requiredLevel })
                let sortedLevels = requiredLevels.sorted(by: { $0 < $1 })
                guard requiredLevels == sortedLevels else { throw ImporterError.invalidPerkLevelProgressionFor(perk, requiredLevels) }
            }
        }
    }
}

enum ImporterError: Error {
    case invalidAttributeCount
    case invalidPerkCountFor(SPECIAL)
    case invalidPerkLevelProgressionFor(Perk, [Int])
    case invalidPerkProgressionFor(SPECIAL, [Int])
    case invalidPerkProgressionCountFor(Perk)
    case missingPerkProgressionFor(Perk)
    case invalidPerkProgressionRanksFor(Perk, [Int])
    case missingSPECIAL([SPECIAL])
}
