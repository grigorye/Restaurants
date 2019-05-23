//
//  MapKitRestaurantsMapViewControllerSnapshotTests.swift
//  RestaurantsViews-Unit-Tests
//
//  Created by Grigory Entin on 19/05/2019.
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
