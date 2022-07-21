//
//  ViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 18.05.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    private var networkManager = NetworkManagerAF.shared
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    
    var allMovies: [Movie] = []
    var moviesForTableView: [Movie] = []
    var genres: [Genre] = []
    
    static var identifier = "ViewController"


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        title = "Movies"
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesForTableView.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        
        cell.configure(with: moviesForTableView[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        
//        vc.movie = moviesForTableView[indexPath.row]
        vc.movieId = moviesForTableView[indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
        let filteredMovies = allMovies.filter { filteredMovies in
            for item in filteredMovies.genreIds {
                if item == genres[indexPath.row].id {
                    print("my genre is \(item) and \(genres[indexPath.row].id)")
                    return true
                }
            }
            return false
        }
        moviesForTableView = filteredMovies
        tableView.reloadData()
    }
}



