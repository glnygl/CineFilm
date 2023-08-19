//
//  CategoriesService.swift
//  CineFilm
//
//  Created by glnygl on 16.08.2023.
//

import Alamofire

class CategoriesService: BaseService {
    
    func getCategories(request: CategoriesRequest, completion:@escaping (Result<Categories, AFError>) -> Void) {
        self.performRequest(request: request, completion: completion)
    }
}
