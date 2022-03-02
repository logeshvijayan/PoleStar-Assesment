//
//  iBookEntity.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import Foundation
import Combine

//MARK: - Model to hold iBook data
struct iBook: Codable {
    let key: String
    let type: String
    let seed : [String]?
    let title: String
    let suggestedTitle: String
    let publishedYear: Int?
    let authorName: [String]?
    
    enum CodingKeys: String, CodingKey {
        case key,type,seed,title
        case suggestedTitle = "title_suggest"
        case publishedYear = "first_publish_year"
        case authorName = "author_name"
    }
}

//MARK: - Model to parse the actual JSON
struct iBooksAPIResponse: Codable {
    let numFound: Int
    let start: Int
    let numFoundExact: Bool
    let docs: [iBook]
}
