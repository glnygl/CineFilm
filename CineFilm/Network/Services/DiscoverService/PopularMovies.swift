//
//  PopularMovies.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Foundation

struct PopularMovies: Codable {
    let results: [PopularMovie]
}

struct PopularMovie: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let image: String?
    let overview: String
    let relaseDate: String
    let rate: Double
    let genres: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image = "poster_path"
        case overview
        case relaseDate = "release_date"
        case rate = "vote_average"
        case genres = "genre_ids"
    }
    
    static func setMovieData(movie: PopularMovie?) -> MovieDataItem {
        return MovieDataItem(id: movie?.id ?? 0, title: movie?.title ?? "", image: movie?.image ?? "", overview: movie?.overview ?? "", relaseDate: movie?.relaseDate ?? "", rate: movie?.rate ?? 0, genres: movie?.genres ?? [])
    }
}
