//
//  DiscoverService.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import Alamofire

protocol DiscoverServiceProtocol {
    func getPopularMovies(request: DiscoverRequest, completion: @escaping (Result<PopularMovies, AFError>) -> Void)
    func getPopularMoviesAsync(request: DiscoverRequest) async -> Result<PopularMovies, AFError> 
}

final class DiscoverService: BaseService, DiscoverServiceProtocol {
    func getPopularMovies(request: DiscoverRequest, completion: @escaping (Result<PopularMovies, AFError>) -> Void) {
        self.performRequest(request: request, completion: completion)
    }
    
    func getPopularMoviesAsync(request: DiscoverRequest) async -> Result<PopularMovies, AFError> {
        return await self.performRequestAsync(request: request)
    }
}
