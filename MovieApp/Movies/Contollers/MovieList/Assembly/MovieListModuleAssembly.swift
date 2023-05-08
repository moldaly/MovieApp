//
//  MovieListModuleAssembly.swift
//  Movies
//
//  Created by tamzimun on 25.07.2022.
//

import UIKit

protocol MovieListModuleInput {
    func configureMovie(with movie: [Movie])
    func configureGenre(with genre: [Genre])
}

typealias MovieListModuleConfiguration = (MovieListModuleInput) -> Void

final class MovieListModuleAssembly {
    
    func assemle(_ configuration: MovieListModuleConfiguration? = nil) -> MovieListViewController {
        
        let dataDisplayManager = MovieListsDataDisplayManager()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        let presenter = MovieListPresenter()
        let network = NetworkManagerAF.shared
        let interactor = MovieListsInteractor(network: network)
        let router = MovieListsRouter()
        
        configuration?(presenter)
        viewController.dataDisplayManager = dataDisplayManager
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return viewController
    }
}
