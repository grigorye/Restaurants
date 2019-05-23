//
//  Location.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

public typealias LocationDegrees = Double

public struct Location : Hashable {
    
    public var latitude: LocationDegrees
    public var longitude: LocationDegrees
    
    public init(latitude: LocationDegrees, longitude: LocationDegrees) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
