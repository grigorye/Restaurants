//
//  MapItemAnnotation.swift
//  RestaurantsMapScene
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
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
