//
//  MovieDetailsRouter.swift
//  Movies
//
//  Created by Aida Moldaly on 22.07.2022.
//

import UIKit

protocol MovieDetailsRouterInput {
    func openCastModule(with castId: Int)
}

final class MovieDetailsRouter: MovieDetailsRouterInput {
    weak var viewController: UIViewController?
    
    func openCastModule(with castId: Int) {
        
        let castDetailViewController = CastDetailsModuleAssembly().assemle() { [weak self] input in

            input.configureCastDetails(with: castId)
        }
        viewController?.navigationController?.pushViewController(castDetailViewController, animated: true)
    }
}

