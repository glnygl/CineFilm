//
//  DiscoverViewModel.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Alamofire

@Observable // @Observable Macro
final class DiscoverViewModel {
    
    var movies: [PopularMovie] = []
    var isDiscoverLoaded = false
    private var service: DiscoverServiceProtocol
    
    init(service: DiscoverServiceProtocol) {
        self.service = service
    }
    
    func getPopularMovies(completion: @escaping (Result<PopularMovies, Error>) -> Void) {
        if isDiscoverLoaded { return }
        let params = DiscoverRequestParams(page: 1)
        let request = DiscoverRequest(queryParams: params)
        
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
    
    @discardableResult
    func getPopularMoviesAsync() async -> Result<PopularMovies, AFError> {
        let params = DiscoverRequestParams(page: 1)
        let request = DiscoverRequest(queryParams: params)
        let result = await service.getPopularMoviesAsync(request: request)
        switch result {
        case .success(let movies):
            self.movies = movies.results
        case .failure(let error):
            print(error)
        }
        return result
    }
}
