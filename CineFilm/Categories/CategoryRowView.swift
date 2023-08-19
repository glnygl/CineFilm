//
//  CategoryRowView.swift
//  CineFilm
//
//  Created by glnygl on 16.08.2023.
//

import SwiftUI

struct CategoryRowView: View {
    
    var category: Category?
    
    var body: some View {
        HStack {
            Image(category?.name.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                .resizable()
                .frame(width: 40.0, height: 40.0)
            Text(category?.name ?? "")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 7)
                .foregroundColor(Color("torchRed"))
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView().previewLayout(.sizeThatFits)
    }
}
