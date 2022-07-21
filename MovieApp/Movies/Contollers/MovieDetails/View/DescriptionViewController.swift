//
//  DescriptionViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit
import Kingfisher

protocol MovieDetailsViewInput: AnyObject {
    func handleObtainedMovieDetails(_ details: MovieDetail)
}

protocol MovieDetailsViewOutput {
    func didloadview()
    func didSelectCastCell(with castId: Int)
}

class DescriptionViewController: UIViewController {
    
    var output: MovieDetailsViewOutput?
    var dataDisplayManager: DescriptionDataDisplayManager?
    
    @IBOutlet var collectioView: UICollectionView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ratContainerView: UIView!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    var movieDetail: MovieDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectioView.dataSource = dataDisplayManager
        collectioView.delegate = dataDisplayManager
    
        output?.didloadview()
    }
}

extension DescriptionViewController {
    
    func upDateUI(_ movieDetail: MovieDetail) {
        
        if let posterUrl = movieDetail.posterUrl {
            let url = URL(string: posterUrl)
            self.imageView.kf.setImage(with: url)
        }
        self.titleLabel.text = movieDetail.name
        self.dateLabel.text = movieDetail.date
        self.descriptionLabel.text = movieDetail.decription
        self.rateLabel.text = "★ \(movieDetail.rating)"

        if movieDetail.rating < 4 {
            self.ratContainerView.backgroundColor = .systemRed
        } else if movieDetail.rating < 7 {
            self.ratContainerView.backgroundColor = .systemOrange
        } else {
            self.ratContainerView.backgroundColor = .systemGreen
        }
        self.title = movieDetail.name
    }
}
    




