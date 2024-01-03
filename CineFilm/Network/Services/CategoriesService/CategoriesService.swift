//
//  CategoriesService.swift
//  CineFilm
//
//  Created by glnygl on 16.08.2023.
//

import Alamofire

protocol CategoriesServiceProtocol {
    func getCategories(request: CategoriesRequest, completion: @escaping (Result<Categories, AFError>) -> Void)
}

final class CategoriesService: BaseService, CategoriesServiceProtocol {
    func getCategories(request: CategoriesRequest, completion: @escaping (Result<Categories, AFError>) -> Void) {
        self.performRequest(request: request, completion: completion)
    }
}
