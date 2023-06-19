//
//  SearchManager.swift
//  NewsApp
//
//  Created by pervın on 14.06.23.
//

import Foundation

class SearchManager {
    static let shared = SearchManager()
    
    func getSearchItems(text: String, complete: @escaping ((Search?, String?) -> ())) {
        NetworkManager.shared.request(model: Search.self,
                                      url: SearchHelper.search.path + "&q=\(text)",
                                      complete: complete)
                                     
        }
    }
