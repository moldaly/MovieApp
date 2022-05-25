//
//  GenreCell.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    @IBOutlet var title: UILabel!
    
    func setUp(with genre: Genre) {
        title.text = genre.name
    }
}



