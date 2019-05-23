//
//  DetailsViewControllerSnapshotTests.swift
//  RestaurantsDetailsScene-Unit-SnapshotTests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

@testable import RestaurantsDetailsScene
import SnapshotTesting
import XCTest

class DetailsViewControllerSnapshotTests : XCTestCase {
    
    func test() {
        let viewController = newViewController()
        viewController.model = sampleRestaurantDetailsModel
        assertSnapshot(matching: viewController, as: .image(drawHierarchyInKeyWindow: true))
        assertSnapshot(matching: viewController, as: .recursiveDescription(on: .iPhoneSe))
        assertSnapshot(matching: viewController, as: .hierarchy)
    }
}

private func newViewController() -> DetailsViewController {
    return .instantiatedFromStoryboard()
}

private let sampleRestaurantDetailsModel = DetailsViewModel(
    name: "d&a Hummus Bistro",
    addressLines: [
        "Address Line 1",
        "Address Line 2"
    ]
)
