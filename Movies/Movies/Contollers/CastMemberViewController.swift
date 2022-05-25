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
    
    var actorImage: UIImage?
    var actorName: String?
    var actorBirthday: String?
    var actorActing: String?
    var actorBiography: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actorImageView.image = actorImage
        actorNameView.text = actorName
        actorBirthdayView.text = actorBirthday
        actorActingView.text = actorActing
        actorBiographyView.text = actorBiography
    }
    

}
