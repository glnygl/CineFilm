//
//  DiscoverRequest.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import Foundation

final class DiscoverRequest: BaseRequest {
    init(params: DiscoverRequestParams) {
        super.init()
        path = RequestPaths.discover.rawValue
        query = Utils.queryString(dictionary: params.dict)
    }
}

struct DiscoverRequestParams: Codable {
    var page: Int?
    var language = "en-US"
    var sort = "popularity.desc"
    var genre: String?
    
    enum CodingKeys: String, CodingKey {
        case page
        case language
        case sort = "sort_by"
        case genre = "with_genres"
    }
}
