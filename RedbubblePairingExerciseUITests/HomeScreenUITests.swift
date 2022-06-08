//
//  HomeScreenUITests.swift
//  RedbubblePairingExerciseUITests
//
//  Created by Ross Richard on 8/6/2022.
//

import XCTest

class HomeScreenUITests: XCTestCase {

    override func setUpWithError() throws {

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

    }

    func testHomeScreen() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
