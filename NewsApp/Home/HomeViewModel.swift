//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by pervın on 03.06.23.
//

import Foundation

class NewsTableViewCellViewModel {
    let title: String
    let subtitle: String
    let imageUrl: URL?
    var imageData: Data? = nil
    
    init(title: String,
         subtitle: String,
         imageUrl: URL?) {
//         imageData: Data?) {
        self.title = title
        self.subtitle = subtitle
        self.imageUrl = imageUrl
//        self.imageData = imageData
    }
    
    
}
