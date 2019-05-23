//
//  MapKitRestaurantsMapViewControllerTests.swift
//  RestaurantsMapScene-UnitTests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

@testable import RestaurantsMapViewKit
import XCTest

class RestaurantsMapViewControllerTests: XCTestCase {

    func testInstantiation() {
        _ = RestaurantsMapViewController.instantiatedFromStoryboard()
    }
}
