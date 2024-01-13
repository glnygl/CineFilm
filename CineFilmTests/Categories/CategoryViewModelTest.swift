//
//  CategoryViewModelTest.swift
//  CineFilmTests
//
//  Created by glnygl on 6.01.2024.
//

import XCTest
@testable import CineFilm

final class CategoryViewModelTest: XCTestCase {
    
    var viewModel: CategoryViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CategoryViewModel(service: DiscoverMockService(shouldSucceed: true), categoryId: 35, categoryName: "Comedy")
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func test_getMovies_fetchSuccesfully() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        viewModel.isCategoryLoaded = false
        var movies: PopularMovies?
        
        // Act
        viewModel.getMovies { response in
            switch response {
            case .success(let result):
                movies = result
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.2)
        
        // Assert
        guard let sum = movies?.results.first?.genres else {
            return XCTFail("Data is empty")
        }
        XCTAssertTrue(sum.contains(35))
    }
    
    func test_getMovies_alreadyLoaded() {
        
        // Arrange
        var sut = 0
        viewModel.isCategoryLoaded = true
        
        // Act
        viewModel.getMovies { _ in
            sut += 1
        }
        
        // Assert
        XCTAssertTrue(sut == 0)
    }
    
    func test_getMovies_shouldThrowError() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        viewModel = CategoryViewModel(service: DiscoverMockService(shouldSucceed: false), categoryId: 35, categoryName: "Comedy")
        viewModel.isCategoryLoaded = false
        var errorDescription: String?
        
        // Act
        viewModel.getMovies { response in
            switch response {
            case .success(_):
                XCTAssertNil(response)
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
