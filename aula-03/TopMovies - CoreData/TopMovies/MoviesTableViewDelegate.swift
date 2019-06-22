//
//  MoviesTableViewDelegate.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 15/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

final class MoviesTableViewDelegate: NSObject {
    weak var moviePresenter: MoviePresenter?
}

extension MoviesTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviePresenter?.presentMovie(with: indexPath)
    }
}
