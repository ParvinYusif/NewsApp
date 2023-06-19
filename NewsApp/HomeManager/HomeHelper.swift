//
//  HomeManager.swift
//  NewsApp
//
//  Created by pervın on 10.06.23.
//

import Foundation

enum HomeCategory: String {
    case popular = "Popular"
}

enum HomeEndpoint: String {
    case popular = "mostpopular/v2/viewed/1.json"

    var path: String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
