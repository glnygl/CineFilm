//
//  SearchViewModel.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var movies: [PopularMovie] = []
    
    func fetchSearchedMovies(query: String) {
        let params = SearchRequestParams(query: query)
        let request = SearchRequest(params: params)
        
        SearchService().getSearchedMovies(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.movies = result.results
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }   
    }   
}
