//
//  MoviesTableViewController.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 15/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit
import CoreData

protocol MoviePresenter: class {
    func presentMovie(with indexPath: IndexPath)
    func deleteMovie(with indexPath: IndexPath)
    func editMovie(with indexPath: IndexPath)
}

class MoviesTableViewController: UITableViewController {
    lazy var dataSource: MoviesTableViewDataSource = {
        let dataSource = MoviesTableViewDataSource()
            dataSource.fetchedResultControllerDelegate = self
            dataSource.loadMovies(with: self.context)
        
        return dataSource
    }()
    
    lazy var delegate: MoviesTableViewDelegate = {
        let delegate = MoviesTableViewDelegate()
            delegate.moviePresenter = self
        
        return delegate
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }
    
    private func prepareTableView() {
        let movieTableViewCell = UINib(nibName: String(describing: MovieTableViewCell.self), bundle: nil)
        let listTableViewCell = UINib(nibName: String(describing: ListTableViewCell.self), bundle: nil)
        
        tableView.register(movieTableViewCell, forCellReuseIdentifier: ItemType.movie.rawValue)
        tableView.register(listTableViewCell, forCellReuseIdentifier: ItemType.list.rawValue)
        
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}

// MARK: - MoviePresenter
extension MoviesTableViewController: MoviePresenter {
    func deleteMovie(with indexPath: IndexPath) {
        let movie = dataSource.fetchedResultController.object(at: indexPath)
        
        context.delete(movie)
        
        try? context.save()
    }
    
    func editMovie(with indexPath: IndexPath) {
        let movie = dataSource.movies[indexPath.row]
        let movieDetailsSB = UIStoryboard.movieRegistration
        guard let movieVC = movieDetailsSB.instantiateInitialViewController() as? MovieRegistrationViewController else { return }
        
        movieVC.movie = movie
        
        navigationController?.show(movieVC, sender: nil)
    }
    
    func presentMovie(with indexPath: IndexPath) {
        let movie = dataSource.movies[indexPath.row
        let movieDetailsSB = UIStoryboard.movieDetail
        guard let movieVC = movieDetailsSB.instantiateInitialViewController() as? MovieViewController else { return }
        
        movieVC.movie = movie
        
        navigationController?.show(movieVC, sender: nil)
    }
}

// MARK: - NSFetchedResultsControllerDelegate
extension MoviesTableViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
}
