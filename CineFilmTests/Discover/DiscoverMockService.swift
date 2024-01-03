//
//  DiscoverMockService.swift
//  CineFilmTests
//
//  Created by glnygl on 29.12.2023.
//

import Foundation
import Alamofire
@testable import CineFilm

class DiscoverMockService: DiscoverServiceProtocol, Mockable {
    
    private var shouldSucceed: Bool
    
    init(shouldSucceed: Bool = true) {
        self.shouldSucceed = shouldSucceed
    }
    
    func getPopularMovies(request: CineFilm.DiscoverRequest, completion: @escaping (Result<CineFilm.PopularMovies, Alamofire.AFError>) -> Void) {
        if shouldSucceed {
            let data = loadJson(fileName: "PopularMoviesFakeData", type: PopularMovies.self)
            completion(.success(data))
        } else {
            completion(.failure(.responseSerializationFailed(reason: .decodingFailed(error: AppError.getPopularMoviesFailed))))
        }
    }
}
