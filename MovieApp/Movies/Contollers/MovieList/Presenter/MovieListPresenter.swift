//
//  MovieListPresenter.swift
//  Movies
//
//  Created by Aida Moldaly on 25.07.2022.
//

import Foundation

final class MovieListPresenter: MovieListsViewOutput, MovieListsInteractorOutput, MovieListModuleInput {
    
    weak var view: MovieListsViewInput!
    var interactor: MovieListsInteractorInput!
    var router: MovieListsRouterInput!
    
    private var movie: [Movie] = []
    private var genre: [Genre] = []
    
    func configureMovie(with movie: [Movie]) {
        self.movie = movie
    }
    
    func configureGenre(with genre: [Genre]) {
        self.genre = genre
    }
    
    func didloadview() {
        view.handleObtainedMovieList(movie)
        view.handleObtainedGenres(genre)
    }
    
    func didSelectGenreCell(with genreId: Int) {
        interactor.obtainMovieList(with: movie, genreId: genreId)
    }
    
    func didSelectMovieCell(with movieId: Int) {
        router.openMovieModule(with: movieId)
    }
    
    func didFiteredMovieList(_ movie: [Movie]) {
        view.handleObtainedMovieList(movie)
    }
    
    func didLoadMovieGenre(_ genre: [Genre]) {
        view.handleObtainedGenres(genre)
    }

}
