//
//  MapRegion.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 19/05/2019.
//


public struct MapRegion {
    public var center: Location
    public var radius: Double
    
    public init(center: Location, radius: Double) {
        self.center = center
        self.radius = radius
    }
}
