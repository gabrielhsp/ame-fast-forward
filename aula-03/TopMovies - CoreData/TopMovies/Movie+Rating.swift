//
//  Movie+Rating.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 22/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import Foundation

extension Movie {
    var movieRating: String {
        let rounded = Int(rating / 2.rounded())
        let filledStars = Array(repeating: "★", count: rounded)
        let emptyStars = Array(repeating: "☆", count: 5-rounded)
 
        return "\(filledStars.joined())\(emptyStars.joined()) \(rating)"
    }
}
