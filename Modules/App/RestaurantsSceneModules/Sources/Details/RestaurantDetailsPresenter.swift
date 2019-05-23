//
//  RestaurantDetailsPresenter.swift
//  Pods
//
//  Created by Grigory Entin on 19/05/2019.
//

import RestaurantsModels
import Foundation

protocol RestaurantDetailsPresenter : AnyObject {
    
    init(detailsView: RestaurantDetailsView, detailsProvider: RestaurantDetailsProvider)
    
    func loadContent()
}

class DefaultRestaurantDetailsPresenter : RestaurantDetailsPresenter {
    
    required init(detailsView: RestaurantDetailsView, detailsProvider: RestaurantDetailsProvider) {
        self.detailsView = detailsView
        self.detailsProvider = detailsProvider
    }
    
    func loadContent() {
        updateForNewDetails()
    }
    
    // MARK: -
    
    private func updateForNewDetails() {
        detailsProvider.details() { [weak self] (result) in
            switch result {
            case .success(let details):
                self?.proceedWithNewDetails(details)
            case .failure(let error):
                self?.proceedWithNewDetailsFailure(error)
            }
        }
    }
    
    private func proceedWithNewDetails(_ details: RestaurantDetails) {
        detailsView.setRestaurantDetails(details)
    }
    
    private func proceedWithNewDetailsFailure(_ error: Error) {
        dump(error)
    }
    
    // MARK: -
    
    private var detailsView: RestaurantDetailsView
    private let detailsProvider: RestaurantDetailsProvider
}
