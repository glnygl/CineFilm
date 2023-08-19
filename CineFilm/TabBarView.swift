//
//  TabBarView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.darkGray
        UITabBar.appearance().barTintColor =  UIColor.darkGray
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        
        TabView {
            DiscoverView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "arrowtriangle.up.fill")
                    Text("Discover")
                }
            SearchView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
         
            CategoriesView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Categories")
                }
         
            FavoritesView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
        .accentColor(Color("torchRed"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

