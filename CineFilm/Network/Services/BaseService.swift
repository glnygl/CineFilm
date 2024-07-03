//
//  BaseService.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import Alamofire

protocol BaseServiceProtocol {
    func performRequest<T:Decodable>(request: BaseRequest, completion:@escaping (Result<T, AFError>) -> Void)
    func performRequestAsync<T:Decodable>(request: BaseRequest) async -> Result<T, AFError>
}

class BaseService: BaseServiceProtocol {
    func performRequest<T:Decodable>(request: BaseRequest, completion:@escaping (Result<T, AFError>) -> Void) {
        AF.request(request)
            .responseDecodable (decoder: JSONDecoder()){ (response: DataResponse<T, AFError>) in
                completion(response.result)
            }
    }
    
    // withCheckedContinuation
    func performRequestAsync<T:Decodable>(request: BaseRequest) async -> Result<T, AFError> {
        return await withCheckedContinuation { continuation in
            AF.request(request)
                .responseDecodable (decoder: JSONDecoder()){ (response: DataResponse<T, AFError>) in
                    continuation.resume(returning: response.result)
                }
        }
    }
}
