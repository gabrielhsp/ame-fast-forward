//
//  MovieTableViewCell.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 15/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    // MARK - IBOutlets
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSummary: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var ivPoster: UIImageView!
    
    // MARK - Super Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension MovieTableViewCell: ReusableMovieCell {
    func prepare(with movie: Movie) {
        lbTitle.text = movie.title
        lbRating.text = "\(movie.rating)"
        lbSummary.text = movie.summary
        
        let image = movie.image ?? ""
        
        if let uiImage = UIImage(named: image + "small") {
            ivPoster.image = uiImage
        } else {
            ivPoster.image = UIImage(named: "deadpool2")
        }
    }
}
