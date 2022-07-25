//
//  CastDetailsPresenter.swift
//  Movies
//
//  Created by Aida Moldaly on 25.07.2022.
//

import Foundation

final class CastDetailsPresenter: CastDetailsViewOutput, CastDetailsInteractorOutput, CastDetailsModuleInput {
    
    weak var view: CastDetailsViewInput!
    var interactor: CastDetailsInteractorInput!
    var router: CastDetailsRouterInput!
    
    private var castId: Int!
    
    func configureCastDetails(with castId: Int) {
        self.castId = castId
    }
    
    func didloadview() {
        interactor.obtainCastDetails(with: castId)
    }
    
    func didLoadCastDetaails(_ castDetails: CastDetail) {
        view.handleObtainedCastDetails(castDetails)
    }
}
