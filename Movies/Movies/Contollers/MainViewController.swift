//
//  MainViewController.swift
//  Movies
//
//  Created by tamzimun on 25.05.2022.
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
    
    var movieCastsHeirs: [Cast] = []
    var movieCastsBlueSea: [Cast] = []
    var movieCastsBoyFlowers: [Cast] = []
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        
        if sectionMovies.count > 0 {
            cell.configure(with: (sectionNames[indexPath.section], movies: sectionMovies[indexPath.section]))
        }
        
        cell.delegate = self
        return cell
    }
    
}

extension MainViewController: UIdelegate {
    func goToDesc(index: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        vc.filmsTitle =  todayAtTheCinema[index].name
        vc.filmsDate = todayAtTheCinema[index].date
        
        if index == 0 {
            vc.casts = movieCastsHeirs
        } else if index == 1 {
            vc.casts = movieCastsBlueSea
        } else if index == 2 {
            vc.casts = movieCastsBoyFlowers
        }

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func goToNext() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.movies = todayAtTheCinema
        self.navigationController?.pushViewController(vc, animated: true)


    }

}

extension MainViewController {
    private func loadGenres() {
         //network request
        networkManager.loadGenres { [weak self] genres in
            self?.genres = genres
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
