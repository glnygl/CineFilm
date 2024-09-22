//
//  SearchViewModelTest.swift
//  CineFilmTests
//
//  Created by glnygl on 8.01.2024.
//

import XCTest
@testable import CineFilm

final class SearchViewModelTest: XCTestCase {
    
    var viewModel: SearchViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SearchViewModel(service: SearchMockService())
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func test_fetchSearchedMovies_fetchSuccesfully() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        let query = "Wonka"
        
        // Act
        viewModel.fetchSearchedMovies(query: query) { _ in
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.2)
        
        let sum = viewModel.movies.first?.title ?? ""
        
        //Assert
        XCTAssertTrue(sum.contains(query))
        
    }
    
    func test_fetchSearchedMovies_throwError() {
       
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        var errorDescription: String?
        let query = "Barbie"
        
        // Act
        viewModel.fetchSearchedMovies(query: query) { response in
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
