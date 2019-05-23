//
//  MKMapView+VisibleRadius.swift
//  RestaurantsMapScene
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import MapKit

extension MKMapView {
    
    func visibleRadius() -> Double {
        let topCenterCoordinate = convert(CGPoint(x: self.frame.size.width / 2, y: 0), toCoordinateFrom: self)
        let topCenterLocation = CLLocation(latitude: topCenterCoordinate.latitude, longitude: topCenterCoordinate.longitude)
        let centerLocation = CLLocation(latitude: centerCoordinate.latitude, longitude: centerCoordinate.longitude)
        return centerLocation.distance(from: topCenterLocation)
    }
}
