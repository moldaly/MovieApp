//
//  DescriptionViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var myCollectioView: UICollectionView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleView: UILabel!
    @IBOutlet var dateView: UILabel!
    @IBOutlet var descriptionView: UILabel!

                
    var filmsImage: UIImage?
    var filmsTitle: String?
    var filmsDate: String?
    var filmsDescription: String?
    var casts: [Cast] = []
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectioView.dataSource = self
        myCollectioView.delegate = self
        titleView.text = filmsTitle
        dateView.text = filmsDate
        descriptionView.text = filmsDescription
        title = filmsTitle
    }
}


extension DescriptionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return casts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCastCell", for: indexPath) as! CastCell
        cell.setUp(with: casts[indexPath.row])

        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CastMemberViewController") as! CastMemberViewController
//        vc.actorImage =  casts[indexPath.row].image
        vc.actorName = casts[indexPath.row].name
        vc.actorActing = casts[indexPath.row].position
        vc.actorBirthday = casts[indexPath.row].birthday
        vc.actorBiography = casts[indexPath.row].biography

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}






