//
//  RestaurantsProvider.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 19/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

public protocol RestaurantsProvider {
    func restaurants(for query: RestaurantQuery, completion: @escaping (Result<[Restaurant], Error>) -> Void)
}

