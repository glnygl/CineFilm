//
//  CineFilmApp.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import SwiftUI
import SwiftData

@main
struct CineFilmApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: MovieDataItem.self)
    }
}
