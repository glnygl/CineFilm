//
//  DiscoverRowView.swift
//  CineFilm
//
//  Created by glnygl on 17.08.2023.
//

import SwiftUI

struct DiscoverRowView: View {
    
    var movie: PopularMovie?
    
    var body: some View {
        
        VStack {
            AsyncImage(
                url: URL(string: ConfigManager.shared.imageURL + (movie?.image ?? "")),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 200, maxHeight: 200)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 2.0, y: 4.0)
                },
                placeholder: {}
            )
        }
    }
}

struct DiscoverRowView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverRowView()
    }
}
