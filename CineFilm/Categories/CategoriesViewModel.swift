//
//  CategoriesViewModel.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    
    @Published var categories: [Category] = []
    @Published var isCategoriesLoaded = false
    
    func getCategories() {
        if isCategoriesLoaded { return }
        let request = CategoriesRequest(params: CategoriesRequestParams())
        
        CategoriesService().getCategories(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.categories = result.genres
                self?.isCategoriesLoaded = true
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
