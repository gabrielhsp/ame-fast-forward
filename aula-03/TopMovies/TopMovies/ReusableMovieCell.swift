//
//  ReusableMovieCell.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 22/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import Foundation

protocol ReusableMovieCell: class {
    func prepare(with movie: Movie)
}
