//
//  VenuesSearchRequestTests.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
//

@testable import RestaurantsFoursquareServices
import SwiftCheck
import XCTest

class VenuesSearchRequestTests : XCTestCase {
    
    func testRequestProperties() {
        property("", arguments: nil) <- forAll { (request: VenuesSearch.Request) in
            return ({ _ = request.url; return true }()) <?> "URL"
        }
    }
}

extension VenuesSearch.Request : Arbitrary {
    
    public static var arbitrary: Gen<VenuesSearch.Request> {
        return .compose { (c) in
            VenuesSearch.Request(lat: c.generate(), lng: c.generate(), radius: c.generate(), categoryIds: c.generate())
        }
    }
}
