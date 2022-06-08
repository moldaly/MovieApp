//
//  DescriptionViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit
import Kingfisher

class DescriptionViewController: UIViewController {
    
    @IBOutlet var myCollectioView: UICollectionView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleView: UILabel!
    @IBOutlet var dateView: UILabel!
    @IBOutlet var descriptionView: UILabel!
    
    var casts: [Cast] = []
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            let url = URL(string: movie.posterUrl ?? "")
            imageView.kf.setImage(with: url)
            titleView.text = movie.name
            dateView.text = movie.date
            descriptionView.text = movie.decription
            title = movie.name
        }
        myCollectioView.dataSource = self
        myCollectioView.delegate = self
    }
}


extension DescriptionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return casts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastCell
        cell.setUp(with: casts[indexPath.row])
        
        cell.onCastsCollectionViewDidTap = { [weak self ]  in
            guard let self = self else { return }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CastMemberViewController") as! CastMemberViewController
            vc.cast =  self.casts[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
}






