//
//  Utils.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import Foundation

class Utils {
    static func queryString(dictionary: [String:Any]?) -> String {
        guard let dictionary = dictionary else { return "" }
        var queryString = "?"
        dictionary.forEach {
            queryString += "&\($0.key)=\($0.value)"
        }
        return queryString
    }
}
