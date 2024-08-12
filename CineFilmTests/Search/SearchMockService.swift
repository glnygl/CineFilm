//
//  SearchMockService.swift
//  CineFilmTests
//
//  Created by glnygl on 29.12.2023.
//

import Foundation
import Alamofire
@testable import CineFilm


class SearchMockService: SearchServiceProtocol, Mockable {
    func getSearchedMovies(request: CineFilm.SearchRequest, completion: @escaping (Result<CineFilm.PopularMovies, Alamofire.AFError>) -> Void) {
        
        if request.queryParams?.query == "Wonka" {
            let data = loadJson(fileName: "SearchFakeData", type: PopularMovies.self)
            completion(.success(data))
        } else {
            completion(.failure(.responseSerializationFailed(reason: .decodingFailed(error: AppError.searchMoviesFailed))))
        }
    }
}
