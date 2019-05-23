//
//  MapViewController.swift
//  RestaurantsMapViewKit
//
//  Created by Grigory Entin on 23/05/2019.
//

import RestaurantsModulePrimitives

public func newMapScene() -> Scene<MapView> {
    let mapViewController = MapViewController.instantiatedFromStoryboard()
    return .init(view: mapViewController, containerController: mapViewController)
}
