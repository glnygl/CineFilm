//
//  DiscoverView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

struct DiscoverView: View {
    
    var viewModel = DiscoverViewModel(service: DiscoverService())
    
    let columns = [
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible(), spacing: 10)
      ]
    
    var body: some View {
        // NavigationStack iOS 16+
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(value: movie) {
                            DiscoverRowView(viewModel: MovieDetailViewModel(service: CastService(), movie: movie))
                        }
                    }
                }
                .padding(10)
                Spacer()
            }
            .navigationTitle("Discover")
            .navigationDestination(for: PopularMovie.self) { movie in
                MovieDetailView(viewModel: MovieDetailViewModel(service: CastService(), movie: movie))
                    .modifier(BaseView())
            }
        }
        .onAppear {
//            viewModel.getPopularMovies{ _ in }
        }
        .task {
            let _ = await viewModel.getPopularMoviesAsync()
        }
    }
}
