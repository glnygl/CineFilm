//
//  Mockable.swift
//  CineFilmTests
//
//  Created by glnygl on 29.12.2023.
//

import Foundation

protocol Mockable: AnyObject {
    
    var bundle: Bundle { get }

    func loadJson<T: Decodable>(fileName: String, type: T.Type) -> T
    
}

extension Mockable {
    
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJson<T: Decodable>(fileName: String, type: T.Type) -> T {
        guard let path = bundle.url(forResource: fileName, withExtension: "json") else {
            fatalError("Failed to load Json file")
        }
        
        do {
            let data = try Data(contentsOf: path, options: .mappedIfSafe)
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return decodedObject
        } catch {
            fatalError("Failed to convert json to data")
        }
    }
}
