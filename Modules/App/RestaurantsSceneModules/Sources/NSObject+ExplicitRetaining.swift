//
//  NSObject+ExplicitRetaining.swift
//  RestaurantsScenes
//
//  Created by Grigory Entin on 21/05/2019.
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
