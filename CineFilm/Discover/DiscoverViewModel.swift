//
//  DiscoverViewModel.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Foundation

class DiscoverViewModel: ObservableObject {
    
    @Published var movies: [PopularMovie] = []    
    
    func getPopularMovies() {
        let params = DiscoverRequestParams(page: 1)
        let request = DiscoverRequest(params: params)
        
        DiscoverService().getPopularMovies(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.movies = result.results
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }    
}
