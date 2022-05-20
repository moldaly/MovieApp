//
//  DescriptionViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var myCastCollectioView: UICollectionView!
    @IBOutlet var filmsImageView: UIImageView!
    @IBOutlet var filmsTitleView: UILabel!
    @IBOutlet var filmsDateView: UILabel!
    @IBOutlet var filmsDescriptionView: UILabel!
    @IBOutlet var castsTitleView: UILabel!
    
    var filmsImage: UIImage?
    var filmsTitle: String?
    var filmsDate: String?
    var filmsDescription: String?
    
    var casts: [Casts] = [
        Casts.init(image: .init(named: "1.jpeg"), name: "Park Shin-Hye", position: "As Cha Eun",id: 1, movie: "Heirs"),
        Casts.init(image: .init(named: "2.jpeg"), name: "Lee Min-Ho", position: "As Kim Tan", id: 2, movie: "Heirs"),
        Casts.init(image: .init(named: "3.jpeg"), name: "Wo-bin Kim", position: "As Young", id: 3, movie: "Heirs"),
        Casts.init(image: .init(named: "4.jpeg"), name: "Kim Ji-Won", position: "As Rachel", id: 4, movie: "Heirs"),
        Casts.init(image: .init(named: "5.jpeg"), name: "Krystal Jung", position: "As Lee Bo", id: 5, movie: "Heirs"),
        
        
        Casts.init(image: .init(named: ""), name: "Park Shin-Hye", position: "As Cha Eun",id: 1, movie: "The legend of the blue sea"),
        Casts.init(image: .init(named: ""), name: "Lee Min-Ho", position: "As Kim Tan", id: 2, movie: "The legend of the blue sea"),
        Casts.init(image: .init(named: ""), name: "Wo-bin Kim", position: "As Young", id: 3, movie: "The legend of the blue sea"),
        Casts.init(image: .init(named: ""), name: "Kim Ji-Won", position: "As Rachel", id: 4, movie: "The legend of the blue sea"),
        Casts.init(image: .init(named: ""), name: "Krystal Jung", position: "As Lee Bo", id: 5, movie: "The legend of the blue sea"),
        
        Casts.init(image: .init(named: ""), name: "Park Shin-Hye", position: "As Cha Eun",id: 1, movie: "Boys over flowers"),
        Casts.init(image: .init(named: ""), name: "Lee Min-Ho", position: "As Kim Tan", id: 2, movie: "Boys over flowers"),
        Casts.init(image: .init(named: ""), name: "Wo-bin Kim", position: "As Young", id: 3, movie: "Boys over flowers"),
        Casts.init(image: .init(named: ""), name: "Kim Ji-Won", position: "As Rachel", id: 4, movie: "Boys over flowers"),
        Casts.init(image: .init(named: ""), name: "Krystal Jung", position: "As Lee Bo", id: 5, movie: "Boys over flowers"),
        
        Casts.init(image: .init(named: ""), name: "Park Shin-Hye", position: "As Cha Eun",id: 1, movie: "Are You Human Too?"),
        Casts.init(image: .init(named: ""), name: "Lee Min-Ho", position: "As Kim Tan", id: 2, movie: "Are You Human Too?"),
        Casts.init(image: .init(named: ""), name: "Wo-bin Kim", position: "As Young", id: 3, movie: "Are You Human Too?"),
        Casts.init(image: .init(named: ""), name: "Kim Ji-Won", position: "As Rachel", id: 4, movie: "Are You Human Too?"),
        Casts.init(image: .init(named: ""), name: "Krystal Jung", position: "As Lee Bo", id: 5, movie: "Are You Human Too?"),
        
        Casts.init(image: .init(named: ""), name: "Park Shin-Hye", position: "As Cha Eun",id: 1, movie: "Moon Lovers: Scarlet Heart Ryeo"),
        Casts.init(image: .init(named: ""), name: "Lee Min-Ho", position: "As Kim Tan", id: 2, movie: "Moon Lovers: Scarlet Heart Ryeo"),
        Casts.init(image: .init(named: ""), name: "Wo-bin Kim", position: "As Young", id: 3, movie: "Moon Lovers: Scarlet Heart Ryeo"),
        Casts.init(image: .init(named: ""), name: "Kim Ji-Won", position: "As Rachel", id: 4, movie: "Moon Lovers: Scarlet Heart Ryeo"),
        Casts.init(image: .init(named: ""), name: "Krystal Jung", position: "As Lee Bo", id: 5, movie: "Moon Lovers: Scarlet Heart Ryeo"),
        
        Casts.init(image: .init(named: ""), name: "Park Shin-Hye", position: "As Cha Eun",id: 1, movie: "What's Wrong with Secretary Kim"),
        Casts.init(image: .init(named: ""), name: "Lee Min-Ho", position: "As Kim Tan", id: 2, movie: "What's Wrong with Secretary Kim"),
        Casts.init(image: .init(named: ""), name: "Wo-bin Kim", position: "As Young", id: 3, movie: "What's Wrong with Secretary Kim"),
        Casts.init(image: .init(named: ""), name: "Kim Ji-Won", position: "As Rachel", id: 4, movie: "What's Wrong with Secretary Kim"),
        Casts.init(image: .init(named: ""), name: "Krystal Jung", position: "As Lee Bo", id: 5, movie: "What's Wrong with Secretary Kim")
                   
    ]
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCastCollectioView.dataSource = self
        filmsImageView.image = filmsImage
        filmsTitleView.text = filmsTitle
        filmsDateView.text = filmsDate
        filmsDescriptionView.text = filmsDescription
        
    }
}

extension DescriptionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return casts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCastCell", for: indexPath) as! CastCell
        cell.setUp(with: casts[indexPath.row])

        return cell
    }
    
}




