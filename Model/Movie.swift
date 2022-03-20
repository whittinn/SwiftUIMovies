//
//  Movie.swift
//  SwiftUIMovie
//
//  Created by Nathaniel Whittington on 3/18/22.
//

import Foundation

struct Movie: Codable, Identifiable {
    var adult: Bool?
    var id: Int?
    var originalLanguage: String?
    var revenue: Int?
    var title: String?
    var releaseDate: String?
    var originalTitle: String?

    enum CodingKeys: String, CodingKey {
            case adult, id, title
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case releaseDate = "release_date"
        }
}
