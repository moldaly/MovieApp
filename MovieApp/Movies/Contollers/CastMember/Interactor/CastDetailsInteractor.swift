//
//  CastDetailsInteractor.swift
//  Movies
//
//  Created by tamzimun on 25.07.2022.
//

import Foundation

protocol CastDetailsInteractorInput {
    func obtainCastDetails(with castId: Int)
}

protocol CastDetailsInteractorOutput: AnyObject {
    func didLoadCastDetaails(_ castDetails: CastDetail)
}

final class CastDetailsInteractor: CastDetailsInteractorInput {
    
    weak var output: CastDetailsInteractorOutput!
    private var network = NetworkManagerAF.shared
    
    required init(network: NetworkManagerAF) {
        self.network = network
    }
    
    func obtainCastDetails(with castId: Int) {
        network.loadCastDetail(id: castId) { [weak self] castDetails in
            self?.output.didLoadCastDetaails(castDetails)
        }
    }
}
