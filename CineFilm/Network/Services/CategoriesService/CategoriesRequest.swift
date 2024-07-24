//
//  CategoriesRequest.swift
//  CineFilm
//
//  Created by glnygl on 16.08.2023.
//

import Foundation

final class CategoriesRequest: BaseRequest {
    
    var queryParams: CategoriesRequestParams?
    
    init(queryParams: CategoriesRequestParams) {
        super.init()
        self.queryParams = queryParams
        path = RequestPaths.categories.rawValue
        query = Utils.queryString(dictionary: queryParams.dict)
    }
}

struct CategoriesRequestParams: Codable {
    var language = "en-US"
}
