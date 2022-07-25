//
//  CastDetailsModuleAssembly.swift
//  Movies
//
//  Created by Aida Moldaly on 25.07.2022.
//

import UIKit

protocol CastDetailsModuleInput {
    func configureCastDetails(with castId: Int)
}

typealias CastDetailsModuleConfiguration = (CastDetailsModuleInput) -> Void

final class CastDetailsModuleAssembly {
    
    func assemle(_ configuration: CastDetailsModuleConfiguration? = nil) -> CastMemberViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CastMemberViewController") as! CastMemberViewController
        let presenter = CastDetailsPresenter()
        let network = NetworkManagerAF.shared
        let interactor = CastDetailsInteractor(network: network)
        let router = CastDetailsRouter()
        
        configuration?(presenter)
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return viewController
    }
}
