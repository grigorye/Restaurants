//
//  RestaurantQuery.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

public struct RestaurantQuery {
    public var region: MapRegion
    
    public init(region: MapRegion) {
        self.region = region
    }
}
