//
//  MKMapView+VisibleRadius.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 19/05/2019.
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
