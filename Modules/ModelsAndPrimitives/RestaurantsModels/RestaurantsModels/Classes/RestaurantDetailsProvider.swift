//
//  RestaurantDetailsProvider.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 19/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

public protocol RestaurantDetailsProvider {
    func details(completion: @escaping (Result<RestaurantDetails, Error>) -> Void)
}
