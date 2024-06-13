//
//  DiscoverView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

struct DiscoverView: View {
    
    @StateObject var viewModel = DiscoverViewModel(service: DiscoverService())
    
    let columns = [
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible(), spacing: 10)
      ]
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink {
                            MovieDetailView(viewModel: MovieDetailViewModel(service: CastService(), movie: movie))
                                .modifier(BaseView())
                        } label: {
                            DiscoverRowView(viewModel: MovieDetailViewModel(service: CastService(), movie: movie))
                                .frame(width: (geo.size.width - 40) / 3)
                        }
                    }
                }
                .padding(10)
                Spacer()
            }
            }
            .navigationTitle("Discover")
        }
        .onAppear {
//            viewModel.getPopularMovies{ _ in }
        }
        .task {
            let _ = await viewModel.getPopularMovies()
        }
    }
}
