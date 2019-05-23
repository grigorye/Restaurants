//
//  DetailsViewController.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
//

import RestaurantsDetailsScene
import RestaurantsSceneModules
import RestaurantsModels

public func newDetailsViewController(forRestaurantID restaurantID: RestaurantID) -> UIViewController {
    
    let detailsProvider: RestaurantDetailsProvider = {
        if UserDefaults.standard.bool(forKey: "ForceFakeRestaurantDetailsProvider") {
            return FakeRestaurantDetailsProvider()
        } else {
            return FoursquareRestaurantDetailsProvider(restaurantID: restaurantID)
        }
    }()
    let scene = newDetailsScene()
    return newDetailsModuleViewController(scene: scene, detailsProvider: detailsProvider)
}

private class FakeRestaurantDetailsProvider: RestaurantDetailsProvider {
    
    func details(completion: @escaping (Result<RestaurantDetails, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(sampleRestaurantDetails))
        }
    }
}

private let sampleRestaurantDetails = RestaurantDetails(
    name: "d&a Hummus Bistro",
    addressLines: [
        "Address Line 1",
        "Address Line 2"
    ]
)
