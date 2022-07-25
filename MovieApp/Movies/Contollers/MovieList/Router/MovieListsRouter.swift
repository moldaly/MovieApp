//
//  MovieListRouter.swift
//  Movies
//
//  Created by Aida Moldaly on 22.07.2022.
//

import UIKit

protocol MovieListsRouterInput {
    func openMovieModule(with movieId: Int)
}

final class MovieListsRouter: MovieListsRouterInput {
    
    weak var viewController: UIViewController?
    
    func openMovieModule(with movieId: Int) {
        // здесь должен создаваться CastModuleAssembly
        
        let movieDetailViewController = MovieDetailsModuleAssembly().assemle() { [weak self] input in

            input.configure(with: movieId)
        }
        viewController?.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}
