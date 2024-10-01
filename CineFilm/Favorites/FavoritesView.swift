//
//  FavoritesView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {

    @Query(sort: \MovieDataItem.title) private var favoriteMovies : [MovieDataItem]
    
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
                        NavigationLink(value: favoriteMovie) {
                            DiscoverRowView(viewModel: MovieDetailViewModel(service: CastService(), movie: favoriteMovie.convertToPopularMovie()))
                        }
                    }
                }
                .padding(10)
                Spacer()
            }
            .navigationTitle("Favorites")
            .navigationDestination(for: MovieDataItem.self) { favoriteMovie in
                MovieDetailView(viewModel: MovieDetailViewModel(service: CastService(), movie: favoriteMovie.convertToPopularMovie()))
                    .removeNavigationBackButtonTitle()
            }
        }
    }
}
