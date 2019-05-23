//
//  DetailsScene.swift
//  RestaurantsDetails
//
//  Created by Grigory Entin on 23/05/2019.
//

import RestaurantsModulePrimitives

public func newDetailsScene() -> Scene<DetailsView> {
    let viewController = DetailsViewController.instantiatedFromStoryboard()
    return .init(view: viewController, containerController: viewController)
}
