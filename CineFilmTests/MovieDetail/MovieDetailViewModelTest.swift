//
//  MovieDetailViewModelTest.swift
//  CineFilmTests
//
//  Created by glnygl on 4.01.2024.
//

import XCTest
@testable import CineFilm

final class MovieDetailViewModelTest: XCTestCase {
    
    var viewModel: MovieDetailViewModel!
    var movie: PopularMovie!  // Wonka 787699
    var favoriteMovie: PopularMovie!  // Oppenheimer 872585
    var storedMovie: MovieDataItem! // Oppenheimer 872585
    
    override func setUp() {
        super.setUp()
        movie = PopularMovie(id: 787699, title: "", image: "", overview: "", relaseDate: "", rate: 0.0, genres: [])
        favoriteMovie = PopularMovie(id: 872585, title: "", image: "", overview: "", relaseDate: "", rate: 0.0, genres: [])
        storedMovie = MovieDataItem(id: 872585, title: "", image: "", overview: "", relaseDate: "", rate: 0.0, genres: [])
        viewModel = MovieDetailViewModel(service: CastMockService(), movie: movie)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_getCast_fetchSuccessfully() {  
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        viewModel.isCastLoaded = false
        var cast: CastResponse?
        
        // Act
        viewModel.getCast(movieId: movie.id) { response in
            switch response {
            case .success(let result):
                cast = result
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.2)
        
        // Assert
        XCTAssertNotNil(cast)
    }
    
    func test_getCast_alreadyLoaded() {
        
        var sut = 0
        viewModel.isCastLoaded = true

        viewModel.getCast(movieId: movie.id) { _ in
            sut += 1
        }
        XCTAssertTrue(sut == 0)
    }
    
    func test_getCast_shouldThrowError() {
        
        // Arrange
        let expectation = XCTestExpectation(description: "Wait for network request")
        viewModel.isCastLoaded = false
        var errorDescription: String?
        
        //Act
        viewModel.getCast(movieId: 787612) { response in
            switch response {
            case .success(let result):
                XCTAssertNil(result)
            case .failure(let error):
                errorDescription = error.localizedDescription
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.2)
        
        //Assert
        XCTAssertNotNil(errorDescription)
    }
    
    func test_checkIsFavorite_shouldReturnTrue() {
        
        var storedMovies: [MovieDataItem] = [storedMovie]
        viewModel.movie = favoriteMovie
        
        let sum = storedMovies.checkIsFavorite(movieId: favoriteMovie.id)
        
        XCTAssertTrue(sum)
    }
    
    func test_checkIsFavorite_shouldReturnFalse() {
        
        var storedMovies: [MovieDataItem] = [storedMovie]
        viewModel.movie = movie
        
        let sum = storedMovies.checkIsFavorite(movieId: movie.id)
        
        XCTAssertFalse(sum)
    }
}
