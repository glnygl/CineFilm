//
//  MovieDetailViewModel.swift
//  CineFilm
//
//  Created by glnygl on 19.08.2023.
//

import Foundation

@Observable // @Observable Macro
final class MovieDetailViewModel {
    
    var movie: PopularMovie?
    var cast: [Cast] = []
    var isFavorite = false
    var isCastLoaded = false
    private var service: CastServiceProtocol
    
    init(service: CastServiceProtocol, movie: PopularMovie) {
        self.service = service
        self.movie = movie
    }
    
    var id: Int {
        movie?.id ?? 0
    }
    
    var title: String {
        movie?.title ?? ""
    }
    
    var releaseDate: String {
        movie?.relaseDate.formatDateString() ?? ""
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
    
    var favoriteMovie: MovieDataItem? {
        movie?.convertMovieData() ?? nil
    }
    
    var favoriteMovies: [MovieDataItem]?
    
    var selectedMovie: MovieDataItem? {
        guard let favoriteMovie = favoriteMovie else { return nil }
        return favoriteMovies?.filter({ $0.id == favoriteMovie.id}).first ?? nil
    }
    
    func getCast(movieId: Int, completion: @escaping (Result<CastResponse, Error>) -> Void) {
        if isCastLoaded { return }
        let request = CastRequest(movieId: movieId)
        
        service.getCast(request: request) { [weak self] response in
            switch response {
            case .success(let result):
                self?.cast = result.cast
                self?.isCastLoaded = true
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
