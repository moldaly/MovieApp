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
    
    private var networkManager = NetworkManagerAF.shared
    
    var cast: Cast?
    var castId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCastInfoByCastID(id: castId!)
    }
}

extension CastMemberViewController {
    private func loadCastInfoByCastID(id: Int) {
        networkManager.loadCastDetail(id: id){ [weak self] castDescription in
            
            let url = URL(string: castDescription.castUrl ?? "")
            self?.castImageView.kf.setImage(with: url)
            self?.nameLabel.text = castDescription.name
            self?.positionLabel.text = castDescription.position
            
            self?.birthdayLabel.text = "\(castDescription.birthday), \(castDescription.birthPlace)"
            self?.biographyLabel.text = castDescription.biography
        }
    }
}
