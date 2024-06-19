//
//  FavoritesView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @StateObject var viewModel = FavoritesViewModel()
    @Query private var favoriteMovies : [MovieDataItem]
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(favoriteMovies) { favoriteMovie in
                        let movie = viewModel.getMovieModel(favoriteMovie: favoriteMovie)
                        NavigationLink(value: favoriteMovie) {
                            DiscoverRowView(viewModel: MovieDetailViewModel(service: CastService(), movie: movie))
                        }
                    }
                }
                .padding(10)
                Spacer()
            }
            .navigationTitle("Favorites")
            .navigationDestination(for: MovieDataItem.self) { favoriteMovie in
                let movie = viewModel.getMovieModel(favoriteMovie: favoriteMovie)
                MovieDetailView(viewModel: MovieDetailViewModel(service: CastService(), movie: movie))
                    .modifier(BaseView())
            }
        }
    }
}
