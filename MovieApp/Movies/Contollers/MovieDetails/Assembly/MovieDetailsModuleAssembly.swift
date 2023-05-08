//
//  MovieDetailsModuleAssembly.swift
//  Movies
//
//  Created by tamzimun on 22.07.2022.
//

import UIKit

protocol MovieDetailsModuleInput {
    func configure(with movieId: Int)
}

typealias MovieDetailsModuleConfiguration = (MovieDetailsModuleInput) -> Void

final class MovieDetailsModuleAssembly {
    
    func assemle(_ configuration: MovieDetailsModuleConfiguration? = nil) -> DescriptionViewController {
        
        let dataDisplayManager = MovieDeatilsDataDisplayManager()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        let presenter = MovieDetailsPresenter()
        let network = NetworkManagerAF.shared
        let interactor = MovieDetailsInteractor(network: network)
        let router = MovieDetailsRouter()
        
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
