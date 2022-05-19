//
//  MovieCell.swift
//  Movies
//
//  Created by Aida Moldaly on 18.05.2022.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var movieImage: UIImageView!
    
    @IBOutlet var movieRate: UILabel!
    
    @IBOutlet var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
