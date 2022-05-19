//
//  DescriptionViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var myCastCollectioView: UICollectionView!

    var casts: [Casts] = [
        Casts.init(image: .init(named: "1.jpeg"), name: "Park Shin-Hye", position: "As Cha Eun"),
        Casts.init(image: .init(named: "2.jpeg"), name: "Lee Min-Ho", position: "As Kim Tan"),
        Casts.init(image: .init(named: "3.jpeg"), name: "Wo-bin Kim", position: "As Young"),
        Casts.init(image: .init(named: "4.jpeg"), name: "Kim Ji-Won", position: "As Rachel"),
        Casts.init(image: .init(named: "5.jpeg"), name: "Krystal Jung", position: "As Lee Bo")
    ]
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCastCollectioView.dataSource = self

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


/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/

