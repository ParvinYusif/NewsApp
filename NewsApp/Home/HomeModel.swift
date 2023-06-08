//
//  HomeStruct.swift
//  NewsApp
//
//  Created by pervın on 03.06.23.
//

import Foundation


struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlTopImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}

