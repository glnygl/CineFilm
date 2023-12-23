//
//  MovieDetailViewModel.swift
//  CineFilm
//
//  Created by glnygl on 19.08.2023.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {
    
    var movie: PopularMovie?
    @Published var cast: [Cast] = []
    private var isCastLoaded = false
    @Published var isFavorite = false
    
    init(movie: PopularMovie) {
        self.movie = movie
    }
    
    var id: Int {
        movie?.id ?? 0
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
    
    var genre: String {
        let genreId = movie?.genres.first ?? 0
        return GenreList.getGenre(id: genreId)
    }
    
    var favoriteImage: String {
        isFavorite ? "heart.fill" : "heart"
    }
    
    var favoriteMovie: MovieDataItem {
        setMovieData()
    }
    
    func getCast(movieId: Int) {
        if isCastLoaded { return }
        let request = CastRequest(movieId: movieId)
        
        CastService().getCast(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.cast = result.cast
                self?.isCastLoaded = true
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    func setMovieData() -> MovieDataItem {
        return MovieDataItem(id: movie?.id ?? 0, title: movie?.title ?? "", image: movie?.image ?? "", overview: movie?.overview ?? "", relaseDate: movie?.relaseDate ?? "", rate: movie?.rate ?? 0, genres: movie?.genres ?? [])
    }
    
    func checkIsFavorite(movies: [MovieDataItem]?) -> Bool {
        guard let movies = movies else { return false }
        let ids = movies.map { $0.id }
        return ids.contains(favoriteMovie.id) ? true : false
    }
}
