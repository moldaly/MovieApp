//
//  MainMovieTableCell.swift
//  Movies
//
//  Created by Aida Moldaly on 25.05.2022.
//

import UIKit

class MainMovieTableCell: UITableViewCell {
    @IBOutlet var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
