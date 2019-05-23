//
//  RestaurantsMapPresenter.swift
//  Pods
//
//  Created by Grigory Entin on 19/05/2019.
//

import RestaurantsModels
import Foundation

protocol RestaurantsMapPresenter : AnyObject {
    
    init(
        mapView: MapView,
        restaurantsProvider: RestaurantsProvider,
        restaurantSelectionHandler: @escaping RestaurantSelectionHandler
    )
    
    func loadContent()
}

class DefaultRestaurantsMapPresenter : RestaurantsMapPresenter, MapViewDelegate {
    
    // MARK: - <RestaurantsMapPresenter>

    required init(
        mapView: MapView,
        restaurantsProvider: RestaurantsProvider,
        restaurantSelectionHandler: @escaping RestaurantSelectionHandler)
    {
        self.mapView = mapView
        self.restaurantsProvider = restaurantsProvider
        self.restaurantSelectionHandler = restaurantSelectionHandler
    }
    
    func loadContent() {
        mapView.delegate = self
        mapViewSelectionDidChange(mapView)
        mapViewVisibleRegionDidChange(mapView)
    }
    
    // MARK: - <MapViewDelegate>

    func mapViewVisibleRegionDidChange(_ mapView: MapView) {
        updateForMapVisibleRegion()
    }
    
    func mapViewSelectionDidChange(_ mapView: MapView) {
        updateForMapSelection()
    }
    
    // MARK: -
    
    private func updateForMapVisibleRegion() {
        let region = mapView.visibleRegion
        let query = RestaurantQuery(region: region)
        restaurantsProvider.restaurants(for: query) { [weak self] (result) in
            switch result {
            case .success(let restaurants):
                self?.proceedWithNewRestaurants(restaurants)
            case .failure(let error):
                self?.proceedWithNewRestaurantsFailure(error)
            }
        }
    }
    
    private func proceedWithNewRestaurants(_ restaurants: [Restaurant]) {
        let mapItems = restaurants.map { MapItem(from: $0) }
        mapView.setItems(mapItems)
    }
    
    private func proceedWithNewRestaurantsFailure(_ error: Error) {
        dump(error)
    }
    
    // MARK: -
    
    private func updateForMapSelection() {
        let restaurantID: RestaurantID? = {
            switch mapView.selection {
            case .none:
                return nil
            case .item(identifier: let selectedItemIdentifier):
                return selectedItemIdentifier
            }
        }()
        restaurantSelectionHandler(restaurantID)
    }
    
    // MARK: -
    
    private var mapView: MapView
    private let restaurantsProvider: RestaurantsProvider
    private let restaurantSelectionHandler: RestaurantSelectionHandler
}

extension MapItem {
    
    init(from restaurant: Restaurant) {
        let identifier = restaurant.id
        let title = restaurant.name
        let location = restaurant.location
        self.init(identifier: identifier, location: location, title: title)
    }
}
