//
//  DetailsScene.swift
//  RestaurantsDetailsScene
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsModulePrimitives

public func newDetailsScene() -> Scene<DetailsView> {
    let viewController = DetailsViewController.instantiatedFromStoryboard()
    return .init(view: viewController, containerController: viewController)
}
