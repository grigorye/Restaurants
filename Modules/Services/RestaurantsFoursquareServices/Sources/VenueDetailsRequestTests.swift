//
//  VenueDetailsRequestTests.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
//

@testable import RestaurantsFoursquareServices
import SwiftCheck
import XCTest

class VenueDetailsRequestTests : XCTestCase {
    
    func testRequestProperties() {
        property("", arguments: nil) <- forAll { (request: VenueDetails.Request) in
            return ({ _ = request.url; return true }()) <?> "URL"
        }
    }
}

extension VenueDetails.Request : Arbitrary {
    
    public static var arbitrary: Gen<VenueDetails.Request> {
        return .compose { (c) in
            VenueDetails.Request(venueID: c.generate())
        }
    }
}
