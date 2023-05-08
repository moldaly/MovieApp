//
//  MovieListsDataDisplayManager.swift
//  Movies
//
//  Created by tamzimun on 22.07.2022.
//

import UIKit

final class MovieListsDataDisplayManager: NSObject {
    
    var moviesForTableView: [Movie] = []
    var genres: [Genre] = []
    
    //CallBack чтобы предать в ViewController movieId, genreId
    var onMovieDidSelect: ((Int) -> Void)?
    var onGenreDidSelect: ((Int) -> Void)?
}

extension MovieListsDataDisplayManager: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myGenreCell", for: indexPath) as! GenreCell
        cell.configure(with: genres[indexPath.row])
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onGenreDidSelect?(genres[indexPath.row].id)
    }
}

extension MovieListsDataDisplayManager: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesForTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        cell.configure(with: moviesForTableView[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onMovieDidSelect?(moviesForTableView[indexPath.row].id)
    }
}
