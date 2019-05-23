//
//  RestaurantDetailsModule.swift
//  RestaurantsSceneModules
//
//  Created by Grigory Entin on 22/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsModulePrimitives
import RestaurantsDetailsScene
import RestaurantsModels
import Foundation

public func newDetailsModuleViewController(
    scene: Scene<DetailsView>,
    detailsProvider: RestaurantDetailsProvider)
    -> UIViewController
{
    return newDetailsModuleViewController(
        scene: scene,
        presenterType: DefaultRestaurantDetailsPresenter.self,
        detailsProvider: detailsProvider
    )
}

func newDetailsModuleViewController(
    scene: Scene<DetailsView>,
    presenterType: RestaurantDetailsPresenter.Type,
    detailsProvider: RestaurantDetailsProvider)
    -> UIViewController
{
    let detailsView: RestaurantDetailsView = DetailsSceneViewAdapter(sceneView: scene.view)

    let presenter = presenterType.init(
        detailsView: detailsView,
        detailsProvider: detailsProvider
    )

    let containerController = scene.containerController
    
    containerController.retain(presenter)
    presenter.loadContent()
    
    return containerController
}

private struct DetailsSceneViewAdapter : RestaurantDetailsView {
    
    // MARK: - <RestaurantDetailsView>
    
    mutating func setRestaurantDetails(_ restaurantDetails: RestaurantDetails) {
        sceneView.model = .init(
            name: restaurantDetails.name,
            addressLines: restaurantDetails.addressLines
        )
    }
    
    // MARK: -
    
    var sceneView: RestaurantsDetailsScene.DetailsView
}
