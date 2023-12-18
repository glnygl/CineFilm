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
    var sort_by = "popularity.desc" 
}
