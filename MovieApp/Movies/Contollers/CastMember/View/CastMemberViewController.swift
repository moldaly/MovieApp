//
//  CastViewController.swift
//  Movies
//
//  Created by tamzimun on 24.05.2022.
//

import UIKit

protocol CastDetailsViewInput: AnyObject {
    func handleObtainedCastDetails(_ details: CastDetail)
}

protocol CastDetailsViewOutput {
    func didloadview()
}

class CastMemberViewController: UIViewController {

    var output: CastDetailsViewOutput?
    
    @IBOutlet var castImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var biographyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didloadview()
    }
}

extension CastMemberViewController: CastDetailsViewInput {
    
    func handleObtainedCastDetails(_ details: CastDetail) {
            
        let url = URL(string: details.castUrl ?? "")
        self.castImageView.kf.setImage(with: url)
        self.nameLabel.text = details.name
        self.positionLabel.text = details.position
        self.birthdayLabel.text = "\(details.birthday), \(details.birthPlace)"
        self.biographyLabel.text = details.biography
    }
}
