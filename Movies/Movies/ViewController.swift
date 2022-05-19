//
//  ViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var myGenreCollectionView: UICollectionView!
    
    var movies: [Movies] = [
        Movies.init(image: UIImage.init(named: "Heirss.jpeg") , name: "Heirs", rate: "☆ 9.9"),
        Movies.init(image: UIImage.init(named: "The legend of the blue sea.jpeg") , name: "The legend of the blue sea", rate: "☆ 9.6"),
        Movies.init(image: UIImage.init(named: "Boys_over_flowers.jpeg") , name: "Boys over flowers", rate: "☆ 9.9"),
        Movies.init(image: UIImage.init(named: "Are_You_Human_Too?.jpeg") , name: "Are You Human Too?", rate: "☆ 8.9"),
        Movies.init(image: UIImage.init(named: "moon.jpeg") , name: "Moon Lovers: Scarlet Heart Ryeo", rate: "☆ 8.7"),
        Movies.init(image: UIImage.init(named: "secretary kim.jpeg") , name: "What's Wrong with Secretary Kim", rate: "☆ 7.9")
    ]
    
    var genres: [Genres] = [
        Genres.init(name: "All"),
        Genres.init(name: "Action"),
        Genres.init(name: "Drama"),
        Genres.init(name: "Horror"),
        Genres.init(name: "Detective"),
        Genres.init(name: "Comedy")
    ]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myGenreCollectionView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        cell.movieImage.image = movies[indexPath.row].image
        cell.movieRate.text = movies[indexPath.row].rate
        cell.movieName.text = movies[indexPath.row].name
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myGenreCell", for: indexPath) as! GenreCell
        cell.setUp(with: genres[indexPath.row])

        return cell
    }
    
}
