//
//  DiscoverView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

struct DiscoverView: View {
    
    @StateObject var viewModel = DiscoverViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.movies) { movie in
                        DiscoverRowView(movie: movie)
                    }
                }.padding(.horizontal)
            }
            .navigationTitle("Discover")
        }
        .onAppear {
            viewModel.getPopularMovies()
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
