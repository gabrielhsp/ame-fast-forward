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
        
        imageViewPoster.layer.cornerRadius = imageViewPoster.frame.size.height / 2
        imageViewPoster.layer.borderWidth = 2
        imageViewPoster.layer.borderColor = #colorLiteral(red: 0.9751263261, green: 0.8584819436, blue: 0.5046803951, alpha: 1)
    }
}

extension ListCollectionViewCell: ReusableMovieCell {
    func prepare(with movie: Movie) {
        imageViewPoster.image = movie.image as? UIImage
    }
}
