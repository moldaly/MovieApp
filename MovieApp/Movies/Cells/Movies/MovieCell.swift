//
//  MovieCell.swift
//  Movies
//
//  Created by tamzimun on 18.05.2022.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {

    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ratingContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with movie: Movie) {
        let url = URL(string: movie.posterUrl ?? "")
        movieImageView.kf.setImage(with: url)
        nameLabel.text = movie.name
        ratingLabel.text = "★ \(movie.rating)"
        
        if movie.rating < 4 {
            ratingContainerView.backgroundColor = .systemRed
        } else if movie.rating < 7 {
            ratingContainerView.backgroundColor = .systemOrange
        } else {
            ratingContainerView.backgroundColor = .systemGreen
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}


