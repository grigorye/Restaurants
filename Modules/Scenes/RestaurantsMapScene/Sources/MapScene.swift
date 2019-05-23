//
//  MapScene.swift
//  RestaurantsMapScene
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsModulePrimitives

public func newMapScene() -> Scene<MapView> {
    let mapViewController = MapViewController.instantiatedFromStoryboard()
    return .init(view: mapViewController, containerController: mapViewController)
}
