//
//  MainViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 25.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private var networkManager = NetworkManagerAF.shared  
    private var genres: [Genre] = [] 
    
    var sectionNames: [String] = ["Today at the cinema", "Soon at the cinema", "Trending movies"]
    
//    struct MoviesArray {
//        var todayMovies: [String?]
//        var soonMovie: [String?]
//        var trendyMovie: [String?]
//    }
    
    lazy var sectionMovies: [[Movie]] = [[],[],[]] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Movies"
        loadGenres()
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
        
        cell.configure(with: (sectionNames[indexPath.row], movies: sectionMovies[indexPath.row], genres: genres))

        cell.onAllMoviesButtonDidTap = { [weak self ] in
            guard let self = self else { return }
            
            let viewController = MovieListModuleAssembly().assemle() { [weak self] input in
                
                guard let self = self else { return }
                input.configureMovie(with: self.sectionMovies[indexPath.row])
                input.configureGenre(with: self.genres)
                
            }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        cell.onMovieCollectionViewDidTap = { [weak self ]  movieIndex in
            guard let self = self else { return }
            // Это логика должна быть в MaunMovieRouter
            let viewController = MovieDetailsModuleAssembly().assemle() { [weak self] input in
                
                guard let self = self else { return }
                input.configure(with: self.sectionMovies[indexPath.row][movieIndex].id)
            }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        return cell
    }
}


extension MainViewController {
    private func loadGenres() {
         //network request
        networkManager.loadGenres { [weak self] genres in
            self?.genres = genres
            self?.loadMovies()
        }
    }
    
    private func loadMovies() {
        networkManager.loadTodayMovies { [weak self] movies in
            self?.sectionMovies[0] = movies
        }
        networkManager.loadSoonMovies { [weak self] movies in
            self?.sectionMovies[1] = movies
        }
        networkManager.loadTrendingMovies { [weak self] movies in
            self?.sectionMovies[2] = movies
        }
    }
}
