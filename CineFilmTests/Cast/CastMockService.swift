//
//  CastMockService.swift
//  CineFilmTests
//
//  Created by glnygl on 29.12.2023.
//

import Foundation
import Alamofire
@testable import CineFilm

class CastMockService: CastServiceProtocol, Mockable {
    
    func getCast(request: CineFilm.CastRequest, completion: @escaping (Result<CineFilm.CastResponse, Alamofire.AFError>) -> Void) {
        if request.movieId == 787699 {
            let data = loadJson(fileName: "CastFakeData", type: CastResponse.self)
            completion(.success(data))
        } else {
            completion(.failure(.responseSerializationFailed(reason: .decodingFailed(error: AppError.getCastFailed))))
        }
    }
    
}
