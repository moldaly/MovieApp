//
//  CastCell.swift
//  Movies
//
//  Created by tamzimun on 19.05.2022.
//

import UIKit

class CastCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameView: UILabel!
    @IBOutlet var positonView: UILabel!
    
    
    func setUp(with cast: Cast) {
//        imageView.image = cast.image
        nameView.text = cast.name
        positonView.text = cast.position
    }
}
