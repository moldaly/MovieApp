//
//  CastViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 24.05.2022.
//

import UIKit

class CastMemberViewController: UIViewController {

    @IBOutlet var actorImageView: UIImageView!
    @IBOutlet var actorNameView: UILabel!
    @IBOutlet var actorBirthdayView: UILabel!
    @IBOutlet var actorActingView: UILabel!
    @IBOutlet var actorBiographyView: UILabel!
    
    var cast: Cast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cast = cast {
            let url = URL(string: cast.castUrl ?? "")
            actorImageView.kf.setImage(with: url)
            actorNameView.text = cast.name
            actorBirthdayView.text = cast.birthday
            actorActingView.text = cast.position
            actorBiographyView.text = cast.biography
        }
    }
}
