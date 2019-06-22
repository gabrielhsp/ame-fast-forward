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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Excluir") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return completionHandler(false) }
            
            self.moviePresenter?.deleteMovie(with: indexPath)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Editar") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return completionHandler(false) }
            
            self.moviePresenter?.editMovie(with: indexPath)
            
            completionHandler(true)
        }
        
        editAction.backgroundColor = .blue
        
        return UISwipeActionsConfiguration(actions: [editAction])
    }
}
