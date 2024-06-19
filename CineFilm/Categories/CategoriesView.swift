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
        NavigationStack {
            List(viewModel.categories) { category in
                NavigationLink(value: category) {
                    CategoryRowView(category: category)
                }
                .listRowInsets(.init(top: 0, leading: 10, bottom: 0, trailing: -8))
                .listRowBackground(Color.white)
                .listRowSeparator(.hidden)
            }
            .navigationDestination(for: Category.self, destination: { category in
                CategoryView(viewModel: CategoryViewModel(service: DiscoverService(), categoryId: category.id, categoryName: category.name))
                    .modifier(BaseView())
            })
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
