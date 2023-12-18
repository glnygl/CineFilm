//
//  SearchView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.movies) { movie in
                    Text(movie.title)
                }.searchable(text: $searchText)
                    .disableAutocorrection(true)
                    .onChange(of: searchText) { newQuery in
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

