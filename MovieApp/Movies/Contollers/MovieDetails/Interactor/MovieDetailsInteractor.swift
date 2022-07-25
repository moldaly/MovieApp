//
//  MovieDetailsInteractor.swift
//  Movies
//
//  Created by Aida Moldaly on 22.07.2022.
//

import Foundation

protocol MovieDetailsInteractorInput {
    // Получает movieId c Presenter movieId
    func obtainMovieDetails(with movieId: Int)
    func obtainMovieCast(with movieId: Int)
}

protocol MovieDetailsInteractorOutput: AnyObject {
    // Отправляет загруженные с network данные в Presenter
    func didLoadMovieDetails(_ details: MovieDetailsEntity)
    func didLoadMovieCast(_ cast: [Cast])
}

final class MovieDetailsInteractor: MovieDetailsInteractorInput {
    weak var output: MovieDetailsInteractorOutput!
    private var network = NetworkManagerAF.shared
    
    required init(network: NetworkManagerAF) {
        self.network = network
    }
    
    func obtainMovieDetails(with movieId: Int) {
        network.loadMovieDetail(id: movieId) { [weak self] details in
            self?.output.didLoadMovieDetails(details)
        }
    }
    
    func obtainMovieCast(with movieId: Int) {
        network.loadCasts(id: movieId) { [weak self] cast in
            self?.output.didLoadMovieCast(cast)
        }
    }
}
