//
//  SearchView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI
import CachedAsyncImage

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.movies) { movie in
                    HStack(spacing: 20) {
                        CachedAsyncImage(url: URL(string: ConfigManager.shared.imageURL + (movie.image ?? ""))){ image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Image("noImage").resizable()
                        } .frame(width: 60, height: 60)
                            .background(Color.gray)
                            .clipShape(Circle())
                        Text(movie.title)
                        NavigationLink {
                            MovieDetailView(viewModel: MovieDetailViewModel(movie: movie))
                                .modifier(BaseView())
                        } label: {}
                    }
                }.searchable(text: $searchText)
                    .disableAutocorrection(true)
                    .onChange(of: searchText) { _ , newQuery in
                        Task { viewModel.fetchSearchedMovies(query: searchText) }
                    }
            }
            .navigationTitle("Search")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    private func printgg(keyword: String) {
        print("g")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

