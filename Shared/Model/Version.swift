//
//  Version.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

class Version: Codable {
    typealias AttributeList = (attribute: Attribute, perks: [Perk])
    
    var attributes: [Attribute] = []
    var id: String
    var name: String
    var perks: [Perk] = []
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    convenience init(id: String, name: String, perks: [Perk]) {
        self.init(id: id, name: name)
        self.perks = perks
    }
    
    func perkChart() -> [AttributeList] {
        let strengthPerks = perksFor(special: .strength)
        let perceptionPerks = perksFor(special: .perception)
        let endurancePerks = perksFor(special: .endurance)
        let charismaPerks = perksFor(special: .charisma)
        let intelligencePerks = perksFor(special: .intelligence)
        let agilityPerks = perksFor(special: .agility)
        let luckPerks = perksFor(special: .luck)
        
        var chart: [(Attribute, [Perk])] = []
        chart.append((attributes[.strength], strengthPerks))
        chart.append((attributes[.perception], perceptionPerks))
        chart.append((attributes[.endurance], endurancePerks))
        chart.append((attributes[.charisma], charismaPerks))
        chart.append((attributes[.intelligence], intelligencePerks))
        chart.append((attributes[.agility], agilityPerks))
        chart.append((attributes[.luck], luckPerks))
        
        return chart
    }
    
    func perksFor(special: SPECIAL) -> [Perk] {
        perks.filter({ $0.special == special })
    }
}

extension Version: Equatable {
    static func == (lhs: Version, rhs: Version) -> Bool {
        return lhs.id == rhs.id
    }
}
