//
//  SearcHelper.swift
//  NewsApp
//
//  Created by pervın on 14.06.23.
//

import Foundation

enum SearchHelper: String {
    case search = "search/v2/articlesearch.json"
    
    var path: String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
