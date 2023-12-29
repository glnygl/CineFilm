//
//  DiscoverService.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import Alamofire

protocol DiscoverServiceProtocol {
    func getPopularMovies(request: DiscoverRequest, completion:@escaping (Result<PopularMovies, AFError>) -> Void)
}

final class DiscoverService: BaseService, DiscoverServiceProtocol {
    func getPopularMovies(request: DiscoverRequest, completion:@escaping (Result<PopularMovies, AFError>) -> Void) {
        self.performRequest(request: request, completion: completion)
    }
}
