//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Michael Craun on 10/14/21.
//

import XCTest
@testable import you_are_special

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws {  }

    override func tearDownWithError() throws {  }
    
    func testPerkChart() {
        let fo4 = Fallout4.game.version
        let strengthPerks = fo4.perksFor(special: .strength)
        
        XCTAssertEqual(fo4.perkChart().count, 7)
        XCTAssertTrue(strengthPerks.contains(where: { $0.name == "Iron Fist" }))
    }
    
}
