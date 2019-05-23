//
//  MapViewControllerTests.swift
//  RestaurantsMapScene-Unit-Tests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

@testable import RestaurantsMapScene
import XCTest

class MapViewControllerTests: XCTestCase {

    func testInstantiation() {
        _ = MapViewController.instantiatedFromStoryboard()
    }
}
