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
    private var wasLastAStrike: Bool = false
    func roll(pins: Int)  {
        totalScore += wasLastAStrike ? pins*2 : pins
        wasLastAStrike = pins == 10 ? true : false
    }
    
    func score() -> Int {
        return totalScore
    }
}

class BowlingTDDTests: XCTestCase {
    let game = Bowling()

    func testScoreWhenNoRollsShouldBeZero() {
        XCTAssertEqual(0, game.score())
    }
    
    func testScoreWhenYouRollSomePins() {
        game.roll(pins: 0)
        XCTAssertEqual(0, game.score())
        let rolledScore = 1
        game.roll(pins: rolledScore)
        XCTAssertEqual(rolledScore, game.score())
    }
    
    func testStrike() {
        game.roll(pins: 10)
        (1...9).forEach { _ in
            game.roll(pins: 1)
        }
        XCTAssertEqual(20, game.score())
    }
}
