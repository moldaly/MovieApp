//
//  DescriptionViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit
import Kingfisher

protocol MovieDetailsViewInput: AnyObject {
    // Получает данные с Presenter и показывает на экране
    func handleObtainedMovieDetails(_ details: MovieDetailsEntity)
    func handleObtainedCast(_ cast: [Cast])
}

protocol MovieDetailsViewOutput {
    // Устанавливает слабую связь с presenter, чтобы любой presenter мог подписаться под этот протокол, и реализовал дальнейшую логику
    // 2 запроса - interactor
    // interactor.obtainMovieDetails(with: movieId)
    // interactor.obtainMovieCast(with: movieId)
    func didloadview()
    // Отправляет castId в CastMemberViewController
    func didSelectCastCell(with castId: Int)
}

class DescriptionViewController: UIViewController {
    
    var output: MovieDetailsViewOutput?
    var dataDisplayManager: MovieDeatilsDataDisplayManager?
    
    @IBOutlet var collectioView: UICollectionView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ratContainerView: UIView!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
//    var movieDetail: MovieDetailsEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        output?.didloadview()
    }
    
    func setUpCollectionView() {
        //Получил castId через collectionview didSelect в dataDisplayManager
        dataDisplayManager?.onCastMemberDidSelect = { [ weak self] castId in
            // Отправляет castId в CastMemberViewController
            self?.output?.didSelectCastCell(with: castId)
        }
        collectioView.dataSource = dataDisplayManager
        collectioView.delegate = dataDisplayManager
    }
}

extension DescriptionViewController: MovieDetailsViewInput {
    // Получает данные с Presenter и показывает на экране
    func handleObtainedMovieDetails(_ movieDetail: MovieDetailsEntity) {
        
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
    
    // Получает данные с Presenter и показывает на экране
    func handleObtainedCast(_ cast: [Cast]) {
        dataDisplayManager?.cast = cast
        collectioView.reloadData()
    }
}
    




