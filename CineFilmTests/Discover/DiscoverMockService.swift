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
    func getPopularMovies(request: CineFilm.DiscoverRequest, completion: @escaping (Result<CineFilm.PopularMovies, Alamofire.AFError>) -> Void) {
        let data = loadJson(fileName: "DiscoverPopularMovies", type: PopularMovies.self)
        completion(.success(data))
    }
}
