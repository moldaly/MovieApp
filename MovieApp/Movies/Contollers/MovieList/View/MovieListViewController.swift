//
//  MovieListViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 18.05.2022.
//

import UIKit
import Kingfisher

protocol MovieListsViewInput: AnyObject {
    // Получает данные с Presenter и показывает на экране
    func handleObtainedMovieList(_ movies: [Movie])
    func handleObtainedGenres(_ genres: [Genre])
}

protocol MovieListsViewOutput {
    // Устанавливает слабую связь с presenter, чтобы любой presenter мог подписаться под этот протокол, и реализовал дальнейшую логику
    func didloadview()
    // Отправляет genreId, movieId в DescriptionViewController
    func didSelectGenreCell(with genreId: Int)
    func didSelectMovieCell(with movieId: Int)
}

class MovieListViewController: UIViewController {
    
    var output: MovieListsViewOutput?
    var dataDisplayManager: MovieListsDataDisplayManager?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    
    static var identifier = "MovieListViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setUpCollectionView()
        output?.didloadview()
        title = "Movies"
    }
    
    func setUpTableView() {
        //Получил movieId через tableview didSelect в dataDisplayManager
        dataDisplayManager?.onMovieDidSelect = { [ weak self] movieId in
            // Отправляет movieId в DescriptionViewController
            self?.output?.didSelectMovieCell(with: movieId)
        }
        tableView.delegate = dataDisplayManager
        tableView.dataSource = dataDisplayManager
    }
    
    func setUpCollectionView() {
        //Получил genreId через collectionview didSelect в dataDisplayManager
        dataDisplayManager?.onGenreDidSelect = { [ weak self] genreId in
            self?.output?.didSelectGenreCell(with: genreId)
        }
        collectionView.dataSource = dataDisplayManager
        collectionView.delegate = dataDisplayManager
    }
}

extension MovieListViewController: MovieListsViewInput {
    
    func handleObtainedMovieList(_ movies: [Movie]) {
        dataDisplayManager?.moviesForTableView = movies
        tableView.reloadData()
    }
    
    func handleObtainedGenres(_ genres: [Genre]) {
        dataDisplayManager?.genres = genres
        collectionView.reloadData()
    }
}



