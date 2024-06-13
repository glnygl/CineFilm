//
//  BaseService.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import Alamofire

protocol BaseServiceProtocol {
    func performRequest<T:Decodable>(request: BaseRequest, completion:@escaping (Result<T, AFError>) -> Void)
}

class BaseService: BaseServiceProtocol {
    func performRequest<T:Decodable>(request: BaseRequest, completion:@escaping (Result<T, AFError>) -> Void) {
        AF.request(request)
            .responseDecodable (decoder: JSONDecoder()){ (response: DataResponse<T, AFError>) in
                completion(response.result)
            }
    }
}
