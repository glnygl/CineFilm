//
//  CastService.swift
//  CineFilm
//
//  Created by glnygl on 23.08.2023.
//

import Alamofire

class CastService: BaseService {
    
    func getCast(request: CastRequest, completion:@escaping (Result<CastResponse, AFError>) -> Void) {
        self.performRequest(request: request, completion: completion)
    }
}
