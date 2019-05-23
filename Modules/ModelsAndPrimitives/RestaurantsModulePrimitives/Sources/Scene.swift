//
//  Scene.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
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
