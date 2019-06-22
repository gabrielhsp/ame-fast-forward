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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderMovie()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func renderMovie() {
        guard let movie = movie else { return }
        
        ivPoster.image = movie.image as? UIImage
        lbTitle.text = movie.title
        lbCategories.text = movie.categories.valid
        lbDuration.text = movie.duration
        lbRating.text = "\(movie.rating)"
        tvSummary.text = movie.summary
    }
}
