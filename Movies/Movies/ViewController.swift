//
//  ViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    var movies: [Movies] = [
        Movies.init(image: UIImage.init(named: "Heirss.jpeg") , name: "Heirs", rate: "☆ 9.9"),
        Movies.init(image: UIImage.init(named: "The legend of the blue sea.jpeg") , name: "The legend of the blue sea", rate: "☆ 9.6"),
        Movies.init(image: UIImage.init(named: "Boys_over_flowers.jpeg") , name: "Boys over flowers", rate: "☆ 9.9"),
        Movies.init(image: UIImage.init(named: "Are_You_Human_Too?.jpeg") , name: "Are You Human Too?", rate: "☆ 8.9"),
        Movies.init(image: UIImage.init(named: "moon.jpeg") , name: " Moon Lovers: Scarlet Heart Ryeo", rate: "☆ 8.7"),
        Movies.init(image: UIImage.init(named: "secretary kim.jpeg") , name: "What's Wrong with Secretary Kim", rate: "☆ 7.9")
    ]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
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
