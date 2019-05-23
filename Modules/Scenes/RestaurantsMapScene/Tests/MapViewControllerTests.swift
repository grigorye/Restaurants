//
//  MapKitRestaurantsMapViewControllerTests.swift
//  Pods-Restaurants
//
//  Created by Grigory Entin on 19/05/2019.
//

@testable import RestaurantsMapViewKit
import XCTest

class RestaurantsMapViewControllerTests: XCTestCase {

    func testInstantiation() {
        _ = RestaurantsMapViewController.instantiatedFromStoryboard()
    }
}
