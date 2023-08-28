//
//  CastResponse.swift
//  CineFilm
//
//  Created by glnygl on 23.08.2023.
//

import Foundation

struct CastResponse: Codable {
    var cast: [Cast]
}

struct Cast: Codable, Hashable {
    var id: Int
    var name: String
    var cover: String?
    var character: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case cover = "profile_path"
        case character
    }
}
