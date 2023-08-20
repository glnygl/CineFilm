//
//  StringExtensions.swift
//  CineFilm
//
//  Created by glnygl on 20.08.2023.
//

import Foundation

extension String {
    func format() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "d MMM yyyy"
        dateFormatter.locale = Locale(identifier: "en_us")
        return dateFormatter.string(from: date)
    }
}
