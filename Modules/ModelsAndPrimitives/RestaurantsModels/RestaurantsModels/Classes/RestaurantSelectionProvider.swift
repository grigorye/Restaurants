//
//  RestaurantSelectionProvider.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 20/05/2019.
//

public protocol RestaurantSelectionProvider {
    func setObserver(closure: RestaurantSelectionHandler?)
}

public typealias RestaurantSelectionHandler = (RestaurantID?) -> Void
