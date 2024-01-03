//
//  CastRequest.swift
//  CineFilm
//
//  Created by glnygl on 23.08.2023.
//

import Foundation

final class CastRequest: BaseRequest {
    
    var movieId: Int
    init(movieId: Int) {
        self.movieId = movieId
        super.init()
        path = String.init(format:  RequestPaths.credits.rawValue, "\(movieId)")
    }
}
