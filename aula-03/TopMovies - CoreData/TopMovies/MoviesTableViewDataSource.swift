//
//  MoviesTableViewDataSource.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 15/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit
import CoreData

final class MoviesTableViewDataSource: NSObject {
    // MARK: - Properties
    weak var fetchedResultControllerDelegate: NSFetchedResultsControllerDelegate?
    var fetchedResultController: NSFetchedResultsController<Movie>!
    var movies: [Movie] {
        return fetchedResultController.fetchedObjects ?? []
    }
    
    let noContentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.numberOfLines = 0
        label.text = "Você não tem \n nenhum filme cadastrado 😭"
        label.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .light)
        
        return label
    }()
    
    // MARK: - Methods
    func loadMovies(with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = fetchedResultControllerDelegate
        
        do {
            try fetchedResultController.performFetch()
        } catch {
            print("It was not possible to load the movies", error)
        }
    }
}

// MARK: - UITableViewDataSource
extension MoviesTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = movies.isEmpty ? noContentLabel : nil
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = fetchedResultController.object(at: indexPath)
        let reuseIdentifier = "movie"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ReusableMovieCell else { return UITableViewCell() }
        
        cell.prepare(with: movie)
        
        return cell as! UITableViewCell
    }
}
