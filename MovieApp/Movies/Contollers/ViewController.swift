//
//  ViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 18.05.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    private var networkManager = NetworkManager.shared
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var myCollectionView: UICollectionView!
    
//    var movies1: [Movie] = []
    var movies: [Movie] = []
    var genres: [Genre] = []
    var casts: [Cast] = []
    
    static var identifier = "ViewController"


    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        title = "Movies"
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        
        cell.configure(with: movies[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        
        vc.movie = movies[indexPath.row]
        
//        networkManager.loadCastByMovieID(id: movies[indexPath.row].id) { [weak self] casts in
//            DispatchQueue.main.async {
//                self?.casts = casts
//            }
//        }

        vc.casts = casts
        
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

//extension ViewController {
//    private func loadCasts(id: Int) {
//        networkManager.loadCastByMovieID(id: id){ [weak self] casts in
//            self?.casts = casts
//        }
//    }
//}

