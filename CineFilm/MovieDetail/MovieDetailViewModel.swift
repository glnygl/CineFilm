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
}
