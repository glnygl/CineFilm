//
//  FavoritesViewModel.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

final class FavoritesViewModel: ObservableObject {
    
    func getMovieModel(favoriteMovie: MovieDataItem) -> PopularMovie {
        return PopularMovie(id: favoriteMovie.id, title: favoriteMovie.title, image: favoriteMovie.image, overview: favoriteMovie.overview, relaseDate: favoriteMovie.relaseDate, rate: favoriteMovie.rate, genres: favoriteMovie.genres)
    }
}
