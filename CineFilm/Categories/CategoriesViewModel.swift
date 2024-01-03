//
//  CategoriesViewModel.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Foundation

final class CategoriesViewModel: ObservableObject {
    
    @Published var categories: [Category] = []
    var isCategoriesLoaded = false
    var service: CategoriesServiceProtocol
    
    init(service: CategoriesServiceProtocol) {
        self.service = service
    }
    
    func getCategories(completion: @escaping (Result<Categories, Error>) -> Void) {
        if isCategoriesLoaded { return }
        let request = CategoriesRequest(params: CategoriesRequestParams())
        
        service.getCategories(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.categories = result.genres
                self?.isCategoriesLoaded = true
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
