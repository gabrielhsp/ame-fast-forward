//
//  MovieViewController.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 15/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

final class MovieViewController: UIViewController {
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var tvSummary: UITextView!
    
    var movie: Movie?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieRegistrationViewController = segue.destination as? MovieRegistrationViewController {
            movieRegistrationViewController.movie = movie
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        renderMovie()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func renderMovie() {
        guard let movie = movie else { return }
        
        ivPoster.image = movie.image as? UIImage
        lbTitle.text = movie.title
        lbCategories.text = movie.categories.valid
        lbDuration.text = movie.duration
        lbRating.text = movie.movieRating
        tvSummary.text = movie.summary
    }
}
