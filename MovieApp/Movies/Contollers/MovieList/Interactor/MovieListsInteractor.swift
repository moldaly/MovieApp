//
//  MovieListsInteractor.swift
//  Movies
//
//  Created by Aida Moldaly on 25.07.2022.
//

import Foundation

protocol MovieListsInteractorInput {
    func obtainMovieList(with movie: [Movie], genreId: Int)
}

protocol MovieListsInteractorOutput: AnyObject {
    func didFiteredMovieList(_ movie: [Movie])
}

final class MovieListsInteractor: MovieListsInteractorInput {
    
    weak var output: MovieListsInteractorOutput!
    private var network = NetworkManagerAF.shared
    
    required init(network: NetworkManagerAF) {
        self.network = network
    }
    
    var filteredMovie: [Movie] = []
    
    func obtainMovieList(with movie: [Movie], genreId: Int) {
        filteredMovie = movie
        let filteredMovies = movie.filter { filteredMovies in
            for item in filteredMovies.genreIds {
                if item == genreId{
                    print("my genre is \(item) and \(genreId)")
                    return true
                }
            }
            return false
        }
        output.didFiteredMovieList(filteredMovies) 
    }
    
}
