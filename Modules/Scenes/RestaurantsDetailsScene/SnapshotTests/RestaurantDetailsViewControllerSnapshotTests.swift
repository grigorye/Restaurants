//
//  RestaurantDetailsViewControllerSnapshotingTests.swift
//  RestaurantsDetailsScene-Unit-SnapshotTests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

@testable import RestaurantsViews
import RestaurantsModels
import XCTest
import FBSnapshotTestCase
import SnapshotTesting

class RestaurantDetailsViewControllerSnapshotingTests : XCTestCase {
    
    func test() {
        let viewController = newViewController()
        record = true
        viewController.model = sampleRestaurantDetailsModel
        assertSnapshot(matching: viewController, as: .image(drawHierarchyInKeyWindow: true))
        assertSnapshot(matching: viewController, as: .recursiveDescription(on: .iPhoneSe))
        assertSnapshot(matching: viewController, as: .hierarchy)
    }
}


private func newViewController() -> RestaurantDetailsViewController {
    return .instantiatedFromStoryboard()
}

private let sampleRestaurantDetailsModel = RestaurantDetailsViewController.Model(
    name: "d&a Hummus Bistro",
    addressLines: [
        "Address Line 1",
        "Address Line 2"
    ]
)
