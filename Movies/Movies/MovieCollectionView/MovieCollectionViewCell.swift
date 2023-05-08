//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by tamzimun on 25.05.2022.
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
    
    func configure(with movie: Movie, genres: [Genre]) {

        NetworkManager.shared.loadImage(with: movie.image ?? "", completion: { [weak self]imageData in
            self?.posterImageView.image = UIImage(data: imageData)
        })
        nameLabel.text = movie.name
        genreLable.text = getGenres(by: movie.genreIds, genres: genres)
        ratingLabel.text = "★ \(movie.rating)"
        
        if movie.rating < 4 {
            ratingContainerView.backgroundColor = .systemRed
        } else if movie.rating < 7 {
            ratingContainerView.backgroundColor = .systemOrange
        } else {
            ratingContainerView.backgroundColor = .systemGreen
        }
    }
    
    func getGenres(by ids: [Int], genres: [Genre]) -> String? {
        var array: [String] = []
        for id in ids {
            array.append(genres.first { $0.id == id }?.name ?? "")
        }
        return array.joined(separator: ", ")
    }
}
