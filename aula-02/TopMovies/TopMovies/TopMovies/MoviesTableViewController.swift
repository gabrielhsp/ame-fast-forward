//
//  MoviesTableViewController.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 15/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

protocol MoviePresenter: class {
    func presentMovie(with indexPath: IndexPath)
}

class MoviesTableViewController: UITableViewController {
    lazy var dataSource: MoviesTableViewDataSource = {
        let dataSource = MoviesTableViewDataSource()
            dataSource.loadMovies()
        
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
        
        tableView.register(movieTableViewCell, forCellReuseIdentifier: ItemType.movie.rawValue)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}

extension MoviesTableViewController: MoviePresenter {
    func presentMovie(with indexPath: IndexPath) {
        let movie = dataSource.movies[indexPath.row]
        let movieDetailsSB = UIStoryboard.movieDetail
        guard let movieVC = movieDetailsSB.instantiateInitialViewController() as? MovieViewController else { return }
        
        movieVC.movie = movie
        
        navigationController?.show(movieVC, sender: nil)
    }
}
