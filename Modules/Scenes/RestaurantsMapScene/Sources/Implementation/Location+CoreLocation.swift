//
//  Location+CoreLocation.swift
//  RestaurantsMapScene
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
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
