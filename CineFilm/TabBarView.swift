//
//  TabBarView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().barTintColor =  UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.darkGray
    }
    
    var body: some View {
        
        TabView {
            DiscoverView()
                .tabItem {
                    Image(systemName: "arrowtriangle.up.fill")
                    Text("Discover")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
         
            CategoriesView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Categories")
                }
         
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
        .accentColor(Color.appColor.torchRed)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

