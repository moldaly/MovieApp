//
//  CastCell.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit

class CastCell: UICollectionViewCell {
    
    @IBOutlet var actorImage: UIImageView!
    @IBOutlet var actorName: UILabel!
    @IBOutlet var actorPositon: UILabel!
    
    
    func setUp(with cast: Casts) {
        actorImage.image = cast.image
        actorName.text = cast.name
        actorPositon.text = cast.position
    }
}
