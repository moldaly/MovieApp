//
//  DescriptionDataDisplayManager.swift
//  Movies
//
//  Created by Aida Moldaly on 21.07.2022.
//

import UIKit

final class MovieDeatilsDataDisplayManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var cast: [Cast] = []
    
    //CallBack чтобы предать в ViewController castId
    var onCastMemberDidSelect: ((Int) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastCell
        cell.setUp(with: cast[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onCastMemberDidSelect?(cast[indexPath.row].id)
    }
}
