//
//  MapRegion.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//


public struct MapRegion {
    public var center: Location
    public var radius: Double
    
    public init(center: Location, radius: Double) {
        self.center = center
        self.radius = radius
    }
}
