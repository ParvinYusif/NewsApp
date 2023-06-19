//
//  NetworkManager.swift
//  NewsApp
//
//  Created by pervın on 10.06.23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
     
     func request<T: Codable>(model: T.Type,
                              url: String,
                              method: HTTPMethod = .get,
                              parameteres: Parameters? = nil,
                              encoding: ParameterEncoding = URLEncoding.default,
                              headers: HTTPHeaders? = nil,
                              complete: @escaping((T?, String?)->())) {
         AF.request(url,
                    method: method,
                    parameters: parameteres,
                    encoding: encoding,
                    headers: headers).responseData { response in
             do {
                 let item = try JSONDecoder().decode(T.self, from: response.data ?? Data())
                 complete(item, nil)
             } catch {
                 complete(nil, error.localizedDescription)
             }
         }
     }
}
