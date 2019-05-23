//
//  RestaurantSelectionProvider.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

public protocol RestaurantSelectionProvider {
    func setObserver(closure: RestaurantSelectionHandler?)
}

public typealias RestaurantSelectionHandler = (RestaurantID?) -> Void
