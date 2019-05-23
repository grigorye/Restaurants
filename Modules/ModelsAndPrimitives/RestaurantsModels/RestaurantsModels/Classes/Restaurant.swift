//
//  Restaurant.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 19/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

public typealias RestaurantID = String

public struct Restaurant {
    public var id: RestaurantID
    public var location: Location
    public var name: String
    
    public init(id: RestaurantID, location: Location, name: String) {
        self.id = id
        self.location = location
        self.name = name
    }
}
