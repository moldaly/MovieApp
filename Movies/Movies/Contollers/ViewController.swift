//
//  ViewController.swift
//  Movies
//
//  Created by tamzimun on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var networkManager = NetworkManager.shared
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var myCollectionView: UICollectionView!
    
    var movies1: [Movie] = []
    var movies: [Movie] = []
    var genres: [Genre] = [] {
        didSet {
            myCollectionView.reloadData()
        }
    }
    
    var movieCastsHeirs: [Cast] = []
    var movieCastsBlueSea: [Cast] = []
    var movieCastsBoyFlowers: [Cast] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        title = "Movies"
        loadGenres()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        
        cell.configure(with: movies[indexPath.item])
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        vc.filmsTitle =  movies[indexPath.row].name
//        vc.filmsImage = movies[indexPath.row].image
        vc.filmsDate = movies[indexPath.row].date
//        vc.filmsDescription = movies[indexPath.row].description
        if indexPath.row == 0 {
            vc.casts = movieCastsHeirs
        } else if indexPath.row == 1 {
            vc.casts = movieCastsBlueSea
        } else if indexPath.row == 2 {
            vc.casts = movieCastsBoyFlowers
        }
        
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
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        for item in movies.indices {
//            if item == "genreIds" {
//                for index in item {
//                    if
//                }
//            }
//        }
//        myTableView.reloadData()
//        
//    }
}

extension ViewController {
    private func loadGenres() {
         //network request
        networkManager.loadGenres { [weak self] genres in
            self?.genres = genres
        }
    }
}
