//
//  CastService.swift
//  CineFilm
//
//  Created by glnygl on 23.08.2023.
//

import Alamofire

protocol CastServiceProtocol {
    func getCast(request: CastRequest, completion:@escaping (Result<CastResponse, AFError>) -> Void)
}

final class CastService: BaseService, CastServiceProtocol {
    
    func getCast(request: CastRequest, completion:@escaping (Result<CastResponse, AFError>) -> Void) {
        self.performRequest(request: request, completion: completion)
    }
}
