//
//  Location.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
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
