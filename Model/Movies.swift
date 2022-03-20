//
//  MoviePage.swift
//  SwiftUIMovie
//
//  Created by Nathaniel Whittington on 3/18/22.
//

import Foundation

struct MoviePages : Codable {
    var page: Int?
    var results: [Movie]?
    var totalPages : Int?
    var totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
            case page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
}
