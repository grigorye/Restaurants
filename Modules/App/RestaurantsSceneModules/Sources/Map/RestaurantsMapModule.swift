//
//  RestaurantsMapModule.swift
//  Pods-Restaurants
//
//  Created by Grigory Entin on 19/05/2019.
//

import RestaurantsMapScene
import RestaurantsModulePrimitives
import RestaurantsModels
import Foundation

public func newMapModuleViewController(
    scene: Scene<MapView>,
    restaurantsProvider: RestaurantsProvider,
    restaurantSelectionHandler: @escaping RestaurantSelectionHandler)
    -> UIViewController
{
    return newMapModuleViewController(
        scene: scene,
        presenterType: DefaultRestaurantsMapPresenter.self,
        restaurantsProvider: restaurantsProvider,
        restaurantSelectionHandler: restaurantSelectionHandler
    )
}

func newMapModuleViewController(
    scene: Scene<MapView>,
    presenterType: RestaurantsMapPresenter.Type,
    restaurantsProvider: RestaurantsProvider,
    restaurantSelectionHandler: @escaping RestaurantSelectionHandler)
    -> UIViewController
{
    let mapView: MapView = scene.view
    
    let presenter: RestaurantsMapPresenter = presenterType.init(
        mapView: mapView,
        restaurantsProvider: restaurantsProvider,
        restaurantSelectionHandler: restaurantSelectionHandler
    )
    
    let containerController = scene.containerController
    
    containerController.retain(presenter)
    presenter.loadContent()
    
    return containerController
}
