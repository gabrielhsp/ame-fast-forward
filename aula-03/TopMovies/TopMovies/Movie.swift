//
//  Movie.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 15/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var title: String?
    var categories: String?
    var duration: String?
    var rating: Double?
    var summary: String?
    var image: String?
    var itemType: ItemType?
    var items: [Movie]?
    
    var stringCategories: String {
        return categories.valid // categories?.joined(separator: " | ") ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case categories
        case duration
        case rating
        case summary = "description"
        case image
        case itemType = "item_type"
        case items
    }
}
