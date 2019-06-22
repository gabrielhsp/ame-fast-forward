//
//  ListTableViewCell.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 22/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movie: Movie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        collectionView.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        /*
        collectionView.delegate = self
        collectionView.dataSource = self
        */
    }
}

extension ListTableViewCell: ReusableMovieCell {
    func prepare(with movie: Movie) {
        self.movie = movie
    }
}

/*
extension ListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ReusableMovieCell,
              let movieItems = self.movie?.items else { return UICollectionViewCell() }
        
        let movie = movieItems[indexPath.item]
        
        cell.prepare(with: movie)
        
        return cell as! UICollectionViewCell
    }
}
*/
