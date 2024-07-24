//
//  BaseRequest.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import Alamofire

enum RequestPaths: String {
    case discover = "discover/movie"
    case search = "search/movie"
    case categories = "genre/movie/list"
    case credits = "movie/%@/credits"
}

class BaseRequest: URLRequestConvertible {
    
    var baseURL = ConfigManager.shared.baseURL
    var path: String = ""
    var query: String = ""
    var method: HTTPMethod = .get
    var parameters: Codable?
    var blocks: Bool = true
    
    let headers = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTRhNzNmN2U2ZTJlYjZlZjZjMTFjNTRiOTk4MjNkZSIsInN1YiI6IjViODkyMWJjOTI1MTQxNGNlMDAwZDQ2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y12CHYfg8hKIbDw4G77kXOHLo05hwuuDb16Nwq0smuE"
    ]
    
    func asURLRequest() throws -> URLRequest {
        let endpoint = baseURL + path + query
        
        guard let url = URL(string: endpoint)
        else {
            throw AFError.invalidURL(url: endpoint)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue
        if let parameters = parameters {
            do {
                let body = try JSONEncoder().encode(parameters)
                urlRequest.httpBody = body
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}
