//
//  CategoriesViewModel.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Alamofire

final class CategoriesViewModel: ObservableObject {
    
   // @MainActor for categories
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
    
    @discardableResult
    func getCategories() async -> Result<Categories, AFError> {
        let request = CategoriesRequest(params: CategoriesRequestParams())
        let result = await service.getCategoriesAsync(request: request)
        switch result {
        case .success(let categories):
//           // Run on MainActor
//            await MainActor.run {
//                self.categories = categories.genres
//            }
            DispatchQueue.main.async {
                self.categories = categories.genres
            }
        case .failure(let error):
            print(error)
        }
        return result
    }
    
}
