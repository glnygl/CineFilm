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
    private var service: DiscoverServiceProtocol
    
    init(service: DiscoverServiceProtocol) {
        self.service = service
    }
    
    func getPopularMovies(completion: @escaping (Result<PopularMovies, Error>) -> Void) {
        if isDiscoverLoaded { return }
        let params = DiscoverRequestParams(page: 1)
        let request = DiscoverRequest(params: params)
        
        service.getPopularMovies(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.movies = result.results
                self?.isDiscoverLoaded = true
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }    
}
