//
//  Search.swift
//  NewsApp
//
//  Created by pervın on 08.06.23.
//

import Foundation

// MARK: - Search
struct Search: Codable {
    let status, copyright: String?
    let response: SearchResponse?
}

// MARK: - Response
struct SearchResponse: Codable {
    let docs: [SearchDoc]?
}

// MARK: - SearchDoc
struct SearchDoc: Codable {
    let abstract: String?
    let webURL: String?
    let snippet, leadParagraph: String?
    let source: String?
    let multimedia: [Multimedia]?
    let pubDate: String?
    let id: String?
    let wordCount: Int?
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case abstract
        case webURL = "web_url"
        case snippet
        case leadParagraph = "lead_paragraph"
        case source, multimedia
        case pubDate = "pub_date"
        case id = "_id"
        case wordCount = "word_count"
        case uri
    }
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let rank: Int?
    let subtype: String?
    let type: String
    let url: String?
    let height, width: Int?
    let legacy: Legacy?
    let subType, cropName: String?

    enum CodingKeys: String, CodingKey {
        case rank, subtype, type, url, height, width, legacy, subType
        case cropName = "crop_name"
    }
}

// MARK: - Legacy
struct Legacy: Codable {
    let xlarge: String?
    let xlargewidth, xlargeheight: Int?
    let thumbnail: String?
    let thumbnailwidth, thumbnailheight, widewidth, wideheight: Int?
    let wide: String?
}
