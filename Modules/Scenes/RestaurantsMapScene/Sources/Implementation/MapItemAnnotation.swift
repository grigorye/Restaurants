//
//  MapPointAnnotation.swift
//  RestaurantsMapViewKit
//
//  Created by Grigory Entin on 19/05/2019.
//

import MapKit

class MapItemAnnotation : MKPointAnnotation {
    
    init(mapItem: MapItem) {
        self.mapItem = mapItem
        super.init()
        self.coordinate = CLLocationCoordinate2D(from: mapItem.location)
    }
    
    let mapItem: MapItem
}
