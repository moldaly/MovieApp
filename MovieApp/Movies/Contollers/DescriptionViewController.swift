//
//  DescriptionViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit
import Kingfisher

class DescriptionViewController: UIViewController {
    
    @IBOutlet var collectioView: UICollectionView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    private var networkManager = NetworkManagerAF.shared
    
    var movieId: Int?
    var casts: [Cast] = []
    {
        didSet {
            collectioView.reloadData()
        }
    }
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            if let posterUrl = movie.posterUrl {
                let url = URL(string: posterUrl)
                imageView.kf.setImage(with: url)
            }
            titleLabel.text = movie.name
            dateLabel.text = movie.date
            descriptionLabel.text = movie.decription
            title = movie.name
        }
        collectioView.dataSource = self
        collectioView.delegate = self
        loadCasts(id: movieId!)
        
    }
}


extension DescriptionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return casts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastCell
        cell.setUp(with: casts[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CastMemberViewController") as! CastMemberViewController
        vc.cast =  self.casts[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension DescriptionViewController {
    private func loadCasts(id: Int) {
        networkManager.loadCastByMovieID(id: id){ [weak self] casts in
            self?.casts = casts
        }
    }
}
    




