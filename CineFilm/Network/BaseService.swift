//
//  BaseService.swift
//  CineFilm
//
//  Created by glnygl on 15.08.2023.
//

import Alamofire

class BaseService {
    func performRequest<T:Decodable>(request: BaseRequest, loadingEnable: Bool = true, completion:@escaping (Result<T, AFError>) -> Void) {
        if request.blocks {
            //loadingEnable ? HudHelper.showBlockingHud() : nil
        }
        
        AF.request(request)
            .responseDecodable (decoder: JSONDecoder()){ (response: DataResponse<T, AFError>) in
                completion(response.result)
                if request.blocks {
                    //loadingEnable ? HudHelper.hideBlockingHud() : nil
                }
            }
    }
}
