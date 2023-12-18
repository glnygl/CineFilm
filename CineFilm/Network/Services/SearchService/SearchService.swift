//
//  SearchService.swift
//  CineFilm
//
//  Created by glnygl on 19.10.2023.
//

import Alamofire

final class SearchService: BaseService {

    func getSearchedMovies(request: SearchRequest, completion:@escaping (Result<PopularMovies, AFError>) -> Void) {
        self.performRequest(request: request, completion: completion)
    }
    
}
