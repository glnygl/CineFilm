//
//  CategoriesViewModelTest.swift
//  CineFilmTests
//
//  Created by glnygl on 3.01.2024.
//

import XCTest
@testable import CineFilm

final class CategoriesViewModelTest: XCTestCase {
    
    var viewModel: CategoriesViewModel!

    override func setUp() {
        super.setUp()
       viewModel = CategoriesViewModel(service: CategoriesMockService())
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func test_getCategories_fetchSuccesfully() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        viewModel.isCategoriesLoaded = false
        
        // Act
        viewModel.getCategories { _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.2)
        
        // Assert
        XCTAssertTrue(viewModel.categories.count > 0)
    }
    
    func test_getCategories_alreadyLoaded() {
    
        var sut = 0
        viewModel.isCategoriesLoaded = true
        
        viewModel.getCategories { _ in
            sut += 1
        }
        XCTAssertTrue(sut == 0)
    }
    
    func test_getCategories_shouldThrowError() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        viewModel = CategoriesViewModel(service: CategoriesMockService(shouldSucceed: false))
        viewModel.isCategoriesLoaded = false
        var errorDescription: String?
        
        // Act
        viewModel.getCategories { response in
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
