//
//  CategoryViewModel.swift
//  CineFilm
//
//  Created by glnygl on 25.12.2023.
//

import Foundation

final class CategoryViewModel: ObservableObject {
    
    @Published var movies: [PopularMovie] = []
    var isCategoryLoaded = false
    private var categoryId: Int
    var categoryName: String
    private var service: DiscoverServiceProtocol
    
    init(service: DiscoverServiceProtocol, categoryId: Int, categoryName: String) {
        self.service = service
        self.categoryId = categoryId
        self.categoryName = categoryName
    }
    
    func getMovies(completion: @escaping (Result<PopularMovies, Error>) -> Void) {
        if isCategoryLoaded { return }
        let params = DiscoverRequestParams(page: 1, genre: String(categoryId))
        let request = DiscoverRequest(queryParams: params)
        
        service.getPopularMovies(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.movies = result.results
                self?.isCategoryLoaded = true
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
