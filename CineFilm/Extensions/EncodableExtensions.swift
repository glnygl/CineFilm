//
//  EncodableExtensions.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import Foundation

extension Encodable {
    var dict : [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return nil }
        return json
    }
}
