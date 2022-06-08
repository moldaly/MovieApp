//
//  MainViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 25.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private var networkManager = NetworkManager.shared  
    private var genres: [Genre] = [] 
    
    var sectionNames: [String] = ["Today at the cinema", "Soon at the cinema", "Trending movies"]

    private var todayAtTheCinema: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var soonAtTheCinema: [Movie] = []
    {
        didSet {
            tableView.reloadData()
        }
    }
    private var trendingMovies: [Movie] = []
    {
        didSet {
            tableView.reloadData()
        }
    }
    
    var casts: [Cast] = []
    {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var sectionMovies: [[Movie]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Movies"
        loadGenres()
        loadMovies()
        loadCasts(id: <#Int#>)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: Bundle(for: MovieTableViewCell.self)), forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.estimatedRowHeight = 355
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        
        if sectionMovies.count > 0 {
            cell.configure(with: (sectionNames[indexPath.row], movies: sectionMovies[indexPath.row], genres: genres))
        }

        cell.onAllMoviesButtonDidTap = { [weak self ] in
            guard let self = self else { return }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: ViewController.identifier) as! ViewController
            vc.movies = self.sectionMovies[indexPath.row]
            vc.genres = self.genres
            vc.casts = self.casts
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.sectionIndex = indexPath.row
        
        cell.onMovieCollectionViewDidTap = { [weak self ] sectionIndex, movieIndex in
            guard let self = self else { return }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
            vc.movie =  self.sectionMovies[sectionIndex][movieIndex]
            
            vc.casts = self.casts
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        return cell
    }
}


extension MainViewController {
    private func loadGenres() {
         //network request
        networkManager.loadGenres { [weak self] genres in
            self?.genres = genres
        }
    }
    private func loadCasts(id: Int) {
        networkManager.loadCastByMovieID(id: id){ [weak self] casts in
            self?.casts = casts
        }
    }
    
    private func loadMovies() {
        networkManager.loadTodayMovies { [weak self] movies in
            self?.todayAtTheCinema = movies
            self?.sectionMovies.append(movies)
        }
        networkManager.loadSoonMovies { [weak self] movies in
            self?.soonAtTheCinema = movies
            self?.sectionMovies.append(movies)
        }
        networkManager.loadTrendingMovies { [weak self] movies in
            self?.trendingMovies = movies
            self?.sectionMovies.append(movies)
        }
    }
}
