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
        totalScore += pins
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
    
    func testScoreWhenYouRollSomePins() {
        let game = Bowling()
        game.roll(pins: 0)
        XCTAssertEqual(0, game.score())
        let rolledScore = 1
        game.roll(pins: rolledScore)
        XCTAssertEqual(rolledScore, game.score())
    }
}
