//
//  BowlingTDDTests.swift
//  BowlingTDDTests
//
//  Created by Shabarinath Pabba on 8/18/22.
//

import XCTest
@testable import BowlingTDD

class Bowling {
    private var totalScore: Int = 0
    func roll(pins: Int)  {
    }
    
    func score() -> Int {
        return totalScore
    }
}

class BowlingTDDTests: XCTestCase {
    func testScoreWhenNoRollsShouldBeZero() {
        let game = Bowling()
        XCTAssertEqual(0, game.score())
    }
}
