//
//  CategoriesView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var viewModel = CategoriesViewModel(service: CategoriesService())
    
    var body: some View {
        NavigationView {
            List(viewModel.categories) { category in
                NavigationLink {
                    CategoryView(viewModel: CategoryViewModel(service: DiscoverService(), categoryId: category.id, categoryName: category.name))
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
            viewModel.getCategories(){ _ in }
        }
    }
}
