//
//  DiscoverViewModelTest.swift
//  CineFilmTests
//
//  Created by glnygl on 29.12.2023.
//

import XCTest
@testable import CineFilm

final class DiscoverViewModelTest: XCTestCase {
    
    var viewModel: DiscoverViewModel!

    override func setUp() {
        super.setUp()
        viewModel = DiscoverViewModel(service: DiscoverMockService())
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func test_getPopularMovies_Succesfully() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        viewModel.isDiscoverLoaded = false
        
        // Act
        viewModel.getPopularMovies {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        
        // Assert
        XCTAssertTrue(viewModel.movies.count > 0)
    }
    
    func test_getPopularMovies_alreadyLoaded() {
        
        // Arrange
        var sut = 0
        viewModel.isDiscoverLoaded = true
        
        // Act
        viewModel.getPopularMovies {
            sut += 1
        }
        
        // Assert
        XCTAssertTrue(sut == 0)
    }
}
