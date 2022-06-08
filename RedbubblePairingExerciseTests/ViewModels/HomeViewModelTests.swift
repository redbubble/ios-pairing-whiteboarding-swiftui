//
//  HomeViewModelTests.swift
//  RedbubblePairingExerciseTests
//
//  Created by Ross Richard on 8/6/2022.
//

import XCTest
import Combine

@testable import RedbubblePairingExercise

class HomeViewModelTests: XCTestCase {

    func testGetExploreSuccess() throws {

        let viewModel = HomeViewModel(service: MockService())
        
        viewModel.getExplore()
        
        XCTAssertFalse(viewModel.items.isEmpty)
        XCTAssertEqual(viewModel.status, .idle)
        XCTAssertTrue(viewModel.errorMessage.isEmpty)
    }

    func testGetExploreError() throws {

        let viewModel = HomeViewModel(service: MockService(publishError: true))
        
        viewModel.getExplore()

        XCTAssertTrue(viewModel.items.isEmpty)
        XCTAssertEqual(viewModel.status, .error)
        XCTAssertTrue(viewModel.errorMessage.isEmpty)
    }
}
