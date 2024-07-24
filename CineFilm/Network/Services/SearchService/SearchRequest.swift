//
//  SearchRequest.swift
//  CineFilm
//
//  Created by glnygl on 19.10.2023.
//

import Foundation

final class SearchRequest: BaseRequest {
    
    var queryParams: SearchRequestParams?
    
    init(queryParams: SearchRequestParams) {
        super.init()
        self.queryParams = queryParams
        path = RequestPaths.search.rawValue
        query = Utils.queryString(dictionary: queryParams.dict)
    }
}

struct SearchRequestParams: Codable {
    
    var query: String
    var include_adult = false
    var language = "en-US"
    var page = 1
    
    init(query: String) {
        self.query = query
    }
}
