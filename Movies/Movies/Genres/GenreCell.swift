//
//  GenreCell.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    @IBOutlet var genreTitle: UILabel!
    
    func setUp(with genre: Genres) {
        genreTitle.text = genre.name
        genreTitle.layer.borderColor = UIColor.orange.cgColor
        genreTitle.layer.borderWidth = 2
        genreTitle.layer.cornerRadius = 5
        genreTitle.layer.masksToBounds = true
    }
}


