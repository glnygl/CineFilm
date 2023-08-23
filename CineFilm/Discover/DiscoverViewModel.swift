//
//  DiscoverViewModel.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Foundation

class DiscoverViewModel: ObservableObject {
    
    @Published var movies: [PopularMovie] = []
    var isDiscoverLoaded = false
    
    func getPopularMovies() {
        if isDiscoverLoaded { return }
        let params = DiscoverRequestParams(page: 1)
        let request = DiscoverRequest(params: params)
        
        DiscoverService().getPopularMovies(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.movies = result.results
                self?.isDiscoverLoaded = true
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }    
}
