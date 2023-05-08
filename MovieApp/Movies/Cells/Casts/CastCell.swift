//
//  CastCell.swift
//  Movies
//
//  Created by Atamzimun on 19.05.2022.
//

import UIKit
import Kingfisher

class CastCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var positonLAbel: UILabel!
    
    func setUp(with cast: Cast) {
        if let castUrl = cast.castUrl {
            let url = URL(string: castUrl)
            imageView.kf.setImage(with: url)
        }
        nameLabel.text = cast.name
        positonLAbel.text = cast.position
    }
}
