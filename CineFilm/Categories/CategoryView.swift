//
//  CategoryView.swift
//  CineFilm
//
//  Created by glnygl on 25.12.2023.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel: CategoryViewModel
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink {
                            MovieDetailView(viewModel: MovieDetailViewModel(service: CastService(), movie: movie))
                                .removeNavigationBackButtonTitle()
                        } label: {
                            DiscoverRowView(viewModel: MovieDetailViewModel(service: CastService(), movie: movie))
                                .frame(width: (geo.size.width - 40) / 3)
                        }
                    }
                }
                .padding(10)
                Spacer()
            }
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationTitle(viewModel.categoryName)
            .onAppear {
                viewModel.getMovies { _ in }
            }
    }
}
