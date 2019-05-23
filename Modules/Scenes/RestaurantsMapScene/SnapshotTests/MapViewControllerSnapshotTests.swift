//
//  MapViewControllerSnapshotingTests.swift
//  RestaurantsMapScene-Unit-SnapshotTests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

@testable import RestaurantsMapScene
import XCTest
import SnapshotTesting

class MapViewControllerSnapshotingTests : XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    #if DEBUG
    func testAnnotations() {
        let viewController = newViewController()
        viewController.setItems(sampleMapItems)
        let window = UIApplication.shared.keyWindow!
        window.rootViewController = viewController
        let mapViewIsReady = expectationForMapIsReady(in: viewController)
        wait(for: [mapViewIsReady], timeout: 10)
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.05))
        assertSnapshot(matching: viewController, as: .image(drawHierarchyInKeyWindow: true, precision: 0.99))
        assertSnapshot(matching: viewController, as: .recursiveDescription(on: .iPhoneSe))
        assertSnapshot(matching: viewController, as: .hierarchy)
    }
    
    func expectationForMapIsReady(in viewController: MapViewController) -> XCTestExpectation {
        return self.expectation(for: NSPredicate(value: true), evaluatedWith: nil) { () -> Bool in
            return viewController.mapViewDidFinishRendering
        }
    }
    #endif
}

private func newViewController() -> MapViewController {
    return .instantiatedFromStoryboard()
}

private let sampleMapItems: [MapItem] = [
    .init(identifier: "1", location: .init(latitude: 52.3783525, longitude: 4.8826805), title: "d&a Hummus Bistro")
]
