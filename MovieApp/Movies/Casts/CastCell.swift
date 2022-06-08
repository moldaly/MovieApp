//
//  CastCell.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit
import Kingfisher

class CastCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameView: UILabel!
    @IBOutlet var positonView: UILabel!
    
    var onCastsCollectionViewDidTap: CallBack?
    
    func setUp(with cast: Cast) {
        let url = URL(string: cast.castUrl ?? "")
        imageView.kf.setImage(with: url)
        nameView.text = cast.name
        positonView.text = cast.position
    }
}
