//
//  MoviesTableViewDataSource.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 15/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

final class MoviesTableViewDataSource: NSObject {
    // MARK: - Properties
    var movies: [Movie] = []
    
    // MARK: - Methods
    func loadMovies() {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder() // jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let movies = try jsonDecoder.decode([Movie].self, from: data)
            
            self.movies = movies.sorted(by: { $0.title.valid < $1.title.valid })
        } catch {
            print("error", error)
        }
    }
}

// MARK: - UITableViewDataSource
extension MoviesTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let reuseIdentifier = movie.itemType?.rawValue ?? ItemType.movie.rawValue
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        cell.prepare(with: movie)
        
        return cell
    }
}
