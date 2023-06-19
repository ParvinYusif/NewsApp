//
//  HomeHelper.swift
//  NewsApp
//
//  Created by pervın on 10.06.23.
//

import Foundation

class HomeManager {
    static let shared = HomeManager()
    
    func getMovieItems(category: HomeCategory, complete: @escaping((MostPopular?, String?)->())) {
        var url = ""
        switch category {
        case .popular:
            url =  HomeEndpoint.popular.path
            NetworkManager.shared.request(model: MostPopular.self,
                                          url: url,
                                          complete: complete)
        }
    }
}
