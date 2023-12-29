//
//  SearchService.swift
//  CineFilm
//
//  Created by glnygl on 19.10.2023.
//

import Alamofire

protocol SearchServiceProtocol {
    func getSearchedMovies(request: SearchRequest, completion:@escaping (Result<PopularMovies, AFError>) -> Void)
}

final class SearchService: BaseService, SearchServiceProtocol {

    func getSearchedMovies(request: SearchRequest, completion:@escaping (Result<PopularMovies, AFError>) -> Void) {
        self.performRequest(request: request, completion: completion)
    }
    
}
