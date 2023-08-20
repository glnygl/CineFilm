//
//  MovieDetailViewModel.swift
//  CineFilm
//
//  Created by glnygl on 19.08.2023.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    var movie: PopularMovie?
    
    init(movie: PopularMovie) {
        self.movie = movie
    }
    
    var title: String {
        movie?.title ?? ""
    }
    
    var releaseDate: String {
        movie?.relaseDate.format() ?? ""
    }
    
    var overview: String {
        movie?.overview ?? ""
    }
    
    var imageUrl: String {
        ConfigManager.shared.imageURL + (movie?.image ?? "")
    }
    
    var rate: Double {
        movie?.rate ?? 0
    }
    
    var shownRate: Double {
        rate / 10
    }
}
