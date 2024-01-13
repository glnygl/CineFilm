//
//  SearchRequest.swift
//  CineFilm
//
//  Created by glnygl on 19.10.2023.
//

import Foundation

final class SearchRequest: BaseRequest {
    
    var params: SearchRequestParams?
    
    init(params: SearchRequestParams) {
        super.init()
        self.params = params
        path = RequestPaths.search.rawValue
        query = Utils.queryString(dictionary: params.dict)
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
