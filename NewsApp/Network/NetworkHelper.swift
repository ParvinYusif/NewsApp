//
//  NetworkHelper.swift
//  NewsApp
//
//  Created by pervın on 10.06.23.
//

import Foundation

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let baseUrl = "https://api.nytimes.com/svc/"
    let apiKey = "Nxs16JgGZBFSHPAxaD6CH6K7oOmHkwO9"
    
    func urlConfig(path: String) -> String {
        baseUrl + path + "?api-key=\(apiKey)"
        
    }
}
