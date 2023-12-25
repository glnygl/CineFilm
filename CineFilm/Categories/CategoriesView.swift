//
//  CategoriesView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var viewModel = CategoriesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.categories) { category in
                NavigationLink {
                    CategoryView(viewModel: CategoryViewModel(categoryId: category.id, categoryName: category.name))
                        .modifier(BaseView())
                } label: {
                    CategoryRowView(category: category)
                }
                .listRowInsets(.init(top: 0, leading: 10, bottom: 0, trailing: -8))
                .listRowBackground(Color.white)
                .listRowSeparator(.hidden)
            }
            .environment(\.defaultMinListRowHeight, 60)
            .navigationTitle("Categories")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scrollIndicators(.hidden)
        }
        .onAppear {
            viewModel.getCategories()
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
