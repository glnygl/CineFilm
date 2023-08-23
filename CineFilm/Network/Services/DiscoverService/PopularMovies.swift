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

struct PopularMovie: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
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
}
