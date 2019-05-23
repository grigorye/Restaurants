//
//  Location+CoreLocation.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
//

import CoreLocation

extension CLLocationCoordinate2D {
    
    init(from location: Location) {
        self.init(
            latitude: location.latitude,
            longitude: location.longitude
        )
    }
}

extension Location {
    
    init(from coordinate: CLLocationCoordinate2D) {
        self.init(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude
        )
    }
}
