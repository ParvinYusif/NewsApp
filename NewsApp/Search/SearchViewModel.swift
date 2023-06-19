//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by pervın on 08.06.23.
//

import Foundation

class SearchViewModel {
    
    var item : Search?

    var search = [SearchDoc]()
    
    var successCallback: (()->())?
    
    func searchText(text: String) {
          SearchManager.shared.getSearchItems(text: text) { searchData, error in
              if let error = error {
                  print( error)
              } else if let searchData = searchData {
                  self.search = searchData.response?.docs ?? []
                  self.successCallback?()
              }
          }
    }
    func resetDatas() {
        item = nil
        search.removeAll()
    }
}
           
        /*APICaller.shared.getSearchItems(text: text) { result in
            switch result {
            case .success(let data):
                self.items = data.response?.docs ?? []
                self.successCallback?()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
         }*/
 
