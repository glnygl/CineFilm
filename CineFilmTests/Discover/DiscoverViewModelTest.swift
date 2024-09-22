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
        viewModel = nil
        super.tearDown()
    }
    
    func test_getPopularMovies_fetchSuccesfully() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        viewModel.isDiscoverLoaded = false
        
        // Act
        viewModel.getPopularMovies { _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.2)
        
        // Assert
        XCTAssertNotNil(viewModel.movies)
    }
    
    func test_getPopularMovies_alreadyLoaded() {
        
        // Arrange
        var sut = 0
        viewModel.isDiscoverLoaded = true
        
        // Act
        viewModel.getPopularMovies { _ in
            sut += 1
        }
        
        // Assert
        XCTAssertTrue(sut == 0)
    }
    
    func test_getPopularMovies_shouldThrowError() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        viewModel = DiscoverViewModel(service: DiscoverMockService(shouldSucceed: false))
        viewModel.isDiscoverLoaded = false
        var errorDescription: String?
        
        // Act
        viewModel.getPopularMovies { response in
            switch response {
            case .success(_):
                XCTAssertNil(response)
                print("")
            case .failure(let error):
                errorDescription = error.localizedDescription
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.2)
        
        // Assert
        XCTAssertNotNil(errorDescription)
    }
}
