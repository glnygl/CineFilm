//
//  ConfigManager.swift
//  CineFilm
//
//  Created by glnygl on 18.08.2023.
//

import Foundation

class ConfigManager: NSObject {
    
    static let shared = ConfigManager()
    
    var baseURL: String = ""
    var imageURL: String = ""
    
    override init() {
        super.init()
        readConfig()
    }
    
    func readConfig() {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) {
                self.baseURL = dict["BaseURL"] as? String ?? ""
                self.imageURL = dict["ImageURL"] as? String ?? ""
            }
        }
    }
}
