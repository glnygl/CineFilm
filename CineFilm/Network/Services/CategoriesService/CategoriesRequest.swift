//
//  CategoriesRequest.swift
//  CineFilm
//
//  Created by glnygl on 16.08.2023.
//

import Foundation

final class CategoriesRequest: BaseRequest {
    
    var params: CategoriesRequestParams?
    
    init(params: CategoriesRequestParams) {
        super.init()
        self.params = params
        path = RequestPaths.categories.rawValue
        query = Utils.queryString(dictionary: params.dict)
    }
}

struct CategoriesRequestParams: Codable {
    var language = "en-US"
}
