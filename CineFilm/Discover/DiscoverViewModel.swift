//
//  DiscoverViewModel.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Foundation

final class DiscoverViewModel: ObservableObject {
    
    @Published var movies: [PopularMovie] = []
    var isDiscoverLoaded = false
    var service: DiscoverServiceProtocol
    
    init(service: DiscoverServiceProtocol) {
        self.service = service
    }
    
    func getPopularMovies(completion: @escaping () -> Void) {
        if isDiscoverLoaded { return }
        let params = DiscoverRequestParams(page: 1)
        let request = DiscoverRequest(params: params)
        
        service.getPopularMovies(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.movies = result.results
                self?.isDiscoverLoaded = true
                completion()
            case .failure(let error):
                print("\(error.localizedDescription)")
                completion()
            }
        }
    }    
}
