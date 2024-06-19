//
//  Categories.swift
//  CineFilm
//
//  Created by glnygl on 16.08.2023.
//

import Foundation

struct Categories: Codable {
    let genres: [Category]
}

struct Category: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
}
