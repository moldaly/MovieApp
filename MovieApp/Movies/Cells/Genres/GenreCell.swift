//
//  GenreCell.swift
//  Movies
//
//  Created by tamzimun on 19.05.2022.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    @IBOutlet var title: UILabel!
    
    func configure(with genre: Genre) {
        title.text = genre.name
    }
}



