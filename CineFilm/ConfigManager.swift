//
//  ConfigManager.swift
//  CineFilm
//
//  Created by glnygl on 18.08.2023.
//

import Foundation

final class ConfigManager: NSObject {
    
    static let shared = ConfigManager()
    
    var baseURL: String = ""
    var imageURL: String = ""
    
    override init() {
        super.init()
        readConfig()
    }
    
    private func readConfig() {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path),
                let baseUrl = dict["BaseURL"] as? String,
                let imageURL = dict["ImageURL"] as? String  {
                self.baseURL = baseUrl
                self.imageURL = imageURL
            }
        }
    }
}
