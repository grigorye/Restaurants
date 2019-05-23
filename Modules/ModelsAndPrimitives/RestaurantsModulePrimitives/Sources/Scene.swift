//
//  Scene.swift
//  RestaurantModulePrimitives
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import UIKit

public struct Scene<View> {
    
    public let view: View
    public let containerController: UIViewController
    
    public init(view: View, containerController: UIViewController) {
        self.view = view
        self.containerController = containerController
    }
}
