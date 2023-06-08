//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by pervın on 08.06.23.
//

import Foundation

class SearchViewModel {
    var items = [SearchDoc]()
    
    var successCallback: (()->())?
    
    func searchText(text: String) {
        APICaller.shared.getSearchItems(text: text) { result in
            switch result {
            case .success(let data):
                self.items = data.response?.docs ?? []
                self.successCallback?()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
