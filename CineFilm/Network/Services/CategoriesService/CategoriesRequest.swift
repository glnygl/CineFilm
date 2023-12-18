//
//  CategoriesRequest.swift
//  CineFilm
//
//  Created by glnygl on 16.08.2023.
//

import Foundation

final class CategoriesRequest: BaseRequest {
    init(params: CategoriesRequestParams) {
        super.init()
        path = RequestPaths.categories.rawValue
        query = Utils.queryString(dictionary: params.dict)
    }
}

struct CategoriesRequestParams: Codable {
    var language = "en-US"
}
