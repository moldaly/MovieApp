//
//  DescriptionDataDisplayManager.swift
//  Movies
//
//  Created by Aida Moldaly on 21.07.2022.
//

import UIKit

final class DescriptionDataDisplayManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var casts: [CastId] = []
    var onCastMemberDidSelect: ((Int) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return casts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastCell
        cell.setUp(with: casts[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onCastMemberDidSelect?(casts[indexPath.row].id)
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CastMemberViewController") as! CastMemberViewController
//        vc.castId = self.casts[indexPath.row].id
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
