//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Aida Moldaly on 25.05.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var ratingContainerView: UIView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genreLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with movie: Movie) {
        posterImageView.image = movie.image
        nameLabel.text = movie.name
//        for item in movie.genreIds {
//            genreLable.text = movie.genreIds[item]
//        }
        guard let rating = movie.rating else { return }
        ratingLabel.text = "★ \(rating)"
        ratingContainerView.backgroundColor = .orange
    }
}
