//
//  AppError.swift
//  CineFilm
//
//  Created by glnygl on 3.01.2024.
//

import Alamofire

enum AppError: Error {
    case getPopularMoviesFailed
    case getCategoriesFailed
    case getCastFailed
    case searchMoviesFailed
}
