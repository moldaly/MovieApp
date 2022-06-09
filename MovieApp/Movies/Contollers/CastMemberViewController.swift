//
//  CastViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 24.05.2022.
//

import UIKit

class CastMemberViewController: UIViewController {

    @IBOutlet var castImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var biographyLabel: UILabel!
    
    var cast: Cast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cast = cast {
            let url = URL(string: cast.castUrl ?? "")
            castImageView.kf.setImage(with: url)
            nameLabel.text = cast.name
            birthdayLabel.text = cast.birthday
            positionLabel.text = cast.position
            biographyLabel.text = cast.biography
        }
    }
}
