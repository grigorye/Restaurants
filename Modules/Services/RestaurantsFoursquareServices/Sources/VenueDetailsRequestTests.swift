//
//  VenueDetailsRequestTests.swift
//  RestaurantsFoursequareServices-Unit-Tests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
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
