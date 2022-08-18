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
    private var wasLastASpare: Bool = false
    
    private var count: Int = 0
    private var earlierFrameCount: Int = 0
    
    func roll(pins: Int)  {
        if pins == 10 {
            if count % 2 == 0 {
                count += 2
            } else {
                count += 1
            }
        } else {
            count += 1
        }
        let isCountOdd = count % 2 == 1
        totalScore += wasLastAStrike ? pins*2 : (wasLastASpare && isCountOdd ? pins*2 : pins)
        wasLastAStrike = pins == 10 ? true : false
        wasLastASpare = (earlierFrameCount + pins == 10) && !wasLastAStrike
        earlierFrameCount = pins
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
    
    func testSpare() { // 9 + 1 + 2 + 2...9
        game.roll(pins: 8)
        game.roll(pins: 2)
        game.roll(pins: 1) // this should be double of 1 = 2
        game.roll(pins: 1) // finish frame 2 but no bonus
        (1...16).forEach { _ in
            game.roll(pins: 1)
        }
        XCTAssertEqual(29, game.score())
    }
}
