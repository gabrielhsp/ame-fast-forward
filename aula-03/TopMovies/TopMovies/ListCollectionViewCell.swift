//
//  ListCollectionViewCell.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 22/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewPoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ListCollectionViewCell: ReusableMovieCell {
    func prepare(with movie: Movie) {
        imageViewPoster.image = UIImage(named: movie.image.valid)
    }
}
