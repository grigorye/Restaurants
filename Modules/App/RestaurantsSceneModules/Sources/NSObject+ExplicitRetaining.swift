//
//  NSObject+ExplicitRetaining.swift
//  RestaurantsSceneModules
//
//  Created by Grigory Entin on 22/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import Foundation
import ObjectiveC.runtime

private var explicitlyRetainedObjectsAssoc: Int = 0

extension NSObject {
    
    var explicitlyRetainedObjects: [AnyObject] {
        get {
            return objc_getAssociatedObject(self, &explicitlyRetainedObjectsAssoc) as! [AnyObject]? ?? []
        }
        set {
            objc_setAssociatedObject(self, &explicitlyRetainedObjectsAssoc, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    func retain(_ otherObject: AnyObject) {
        self.explicitlyRetainedObjects.append(otherObject)
    }
}
