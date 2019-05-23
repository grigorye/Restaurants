//
//  VenuesSearchResponseTests.swift
//  RestaurantsFoursequareServices-Unit-Tests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

@testable import RestaurantsFoursquareServices
import SwiftCheck
import XCTest

class VenuesSearchResponseTests : XCTestCase {
    
    func testInitWithValidData() {
        XCTAssertNoThrow(try VenuesSearch.Response(data: venuesSearchValidResponseData))
    }
    
    func testInitWithEmptyData() {
        XCTAssertThrowsError(try VenuesSearch.Response(data: Data()))
    }

    func testProperties() {
        
        func testInit(data: Data) -> Bool {
            do {
                _ = try VenuesSearch.Response(data: data)
            } catch {
            }
            return true
        }
        property("", arguments: nil) <- forAll { (sample: VenuesSearchResponseSample) in
            return testInit(data: sample.data) <?> ""
        }
    }
}

struct VenuesSearchResponseSample : Arbitrary {
    let data: Data
    
    public static var arbitrary: Gen<VenuesSearchResponseSample> {
        let generators: [Gen<VenuesSearchResponseSample>] = [
            .pure(.init(data: venuesSearchValidResponseData)),
            .pure(.init(data: Data()))
        ]
        return .one(of: generators)
    }
}

private let venuesSearchValidResponseData: Data = {
    let bundle = Bundle(for: VenuesSearchResponseTests.self)
    let resourceURL = bundle.url(forResource: "VenuesSearchResponseTests", withExtension: "json")!
    let data = try! Data(contentsOf: resourceURL)
    return data
}()
