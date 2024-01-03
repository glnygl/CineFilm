//
//  CategoryViewModel.swift
//  CineFilm
//
//  Created by glnygl on 25.12.2023.
//

import Foundation

final class CategoryViewModel: ObservableObject {
    
    @Published var movies: [PopularMovie] = []
    private var isCategoryLoaded = false
    private var categoryId: Int
    var categoryName: String
    var service: DiscoverServiceProtocol
    
    init(service: DiscoverServiceProtocol, categoryId: Int, categoryName: String) {
        self.service = service
        self.categoryId = categoryId
        self.categoryName = categoryName
    }
    
    func getMovies() {
        if isCategoryLoaded { return }
        let params = DiscoverRequestParams(page: 1, genre: String(categoryId))
        let request = DiscoverRequest(params: params)
        
        service.getPopularMovies(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.movies = result.results
                self?.isCategoryLoaded = true
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
}
