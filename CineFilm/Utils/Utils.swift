//
//  Utils.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import Foundation

final class Utils {
    static func queryString(dictionary: [String:Any]?) -> String {
        guard let dictionary = dictionary else { return "" }
        var queryString = "?"
        let mappedString = dictionary.compactMap({ key, value in
            "\(key)=\(value)"
        }).joined(separator: "&")
        return  queryString + mappedString
    }
}
