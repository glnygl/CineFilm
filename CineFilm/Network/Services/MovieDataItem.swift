//
//  MovieDataItem.swift
//  CineFilm
//
//  Created by glnygl on 21.12.2023.
//

import SwiftData

@Model
class MovieDataItem: Hashable {
    var id: Int
    var title: String
    var image: String?
    var overview: String
    var relaseDate: String
    var rate: Double
    var genres: [Int]
    
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
    
    func convertToPopularMovie() -> PopularMovie {
        PopularMovie(id: self.id, title: self.title, image: self.image, overview: self.overview, relaseDate: self.relaseDate, rate: self.rate, genres: self.genres)
    }
}

//extension Array where Element == MovieDataItem

typealias MovieDataItemArray = [MovieDataItem]

extension MovieDataItemArray {
    
    func checkIsFavorite(movieId: Int) -> Bool {
        let ids = self.map { $0.id }
        return ids.contains(movieId) ? true : false
    }
    
    func getSelectedMovie(movieId: Int) -> MovieDataItem? {
        self.filter({ $0.id == movieId}).first ?? nil
    }
    
}
