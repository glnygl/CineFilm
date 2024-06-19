//
//  MovieDataItem.swift
//  CineFilm
//
//  Created by glnygl on 21.12.2023.
//

import Foundation
import SwiftData

@Model
class MovieDataItem: Hashable {
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
    
    init(id: Int, title: String, image: String?, overview: String, relaseDate: String, rate: Double, genres: [Int]) {
        self.id = id
        self.title = title
        self.image = image
        self.overview = overview
        self.relaseDate = relaseDate
        self.rate = rate
        self.genres = genres
    }
}
