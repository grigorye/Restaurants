//
//  VenueDetailsResponseTests.swift
//  RestaurantsFoursequareServices-Unit-Tests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

@testable import RestaurantsFoursquareServices
import SwiftCheck
import XCTest

class VenueDetailsResponseTests : XCTestCase {
    
    func testInitWithValidData() {
        XCTAssertNoThrow(try VenueDetails.Response(data: venueDetailsValidResponseData))
    }
    
    func testInitWithEmptyData() {
        XCTAssertThrowsError(try VenueDetails.Response(data: Data()))
    }
    
    func testProperties() {
        
        func testInit(data: Data) -> Bool {
            do {
                _ = try VenueDetails.Response(data: data)
            } catch {
            }
            return true
        }
        property("", arguments: nil) <- forAll { (sample: VenueDetailsResponseSample) in
            return testInit(data: sample.data) <?> ""
        }
    }
}

struct VenueDetailsResponseSample : Arbitrary {
    
    let data: Data
    
    public static var arbitrary: Gen<VenueDetailsResponseSample> {
        let generators: [Gen<VenueDetailsResponseSample>] = [
            .pure(.init(data: venueDetailsValidResponseData)),
            .pure(.init(data: Data()))
        ]
        return .one(of: generators)
    }
}

private let venueDetailsValidResponseData: Data = {
    let bundle = Bundle(for: VenueDetailsResponseTests.self)
    let resourceURL = bundle.url(forResource: "VenueDetailsResponseTests", withExtension: "json")!
    let data = try! Data(contentsOf: resourceURL)
    return data
}()
