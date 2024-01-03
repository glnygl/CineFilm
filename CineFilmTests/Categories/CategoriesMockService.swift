//
//  CategoriesMockService.swift
//  CineFilmTests
//
//  Created by glnygl on 29.12.2023.
//

import Foundation
import Alamofire
@testable import CineFilm

class CategoriesMockService: CategoriesServiceProtocol, Mockable {   
    
    private var shouldSucceed: Bool
    
    init(shouldSucceed: Bool = true) {
        self.shouldSucceed = shouldSucceed
    }
    
    func getCategories(request: CineFilm.CategoriesRequest, completion: @escaping (Result<CineFilm.Categories, Alamofire.AFError>) -> Void) {
        
        if shouldSucceed {
            let data = loadJson(fileName: "CategoriesFakeData", type: Categories.self)
            completion(.success(data))
        } else {
            completion(.failure(.responseSerializationFailed(reason: .decodingFailed(error: AppError.getCategoriesFailed))))
        }
    }
}

