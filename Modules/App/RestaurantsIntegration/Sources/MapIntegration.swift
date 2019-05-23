//
//  MapIntegration.swift
//  RestaurantsIntegration
//
//  Created by Grigory Entin on 22/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsMapScene
import RestaurantsSceneModules
import RestaurantsModels

public func newMapViewController(restaurantSelectionHandler: @escaping RestaurantSelectionHandler) -> UIViewController {
    
    let scene = newMapScene()
    let restaurantsProvider: RestaurantsProvider = {
        if UserDefaults.standard.bool(forKey: "ForceFakeRestaurantsProvider") {
            return FakeRestaurantsProvider()
        } else {
            return FoursquareRestaurantsProvider()
        }
    }()
    
    return newMapModuleViewController(
        scene: scene,
        restaurantsProvider: restaurantsProvider,
        restaurantSelectionHandler: restaurantSelectionHandler
    )
}

private class FakeRestaurantsProvider: RestaurantsProvider {
    func restaurants(for query: RestaurantQuery, completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(sampleRestaurants))
        }
    }
}

private let sampleRestaurants: [Restaurant] = [
    .init(id: "1", location: .init(latitude: 52.3783525, longitude: 4.8826805), name: "d&a Hummus Bistro")
]
