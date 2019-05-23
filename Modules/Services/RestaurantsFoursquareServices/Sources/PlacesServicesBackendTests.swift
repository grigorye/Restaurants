//
//  PlacesServicesBackendTests.swift
//  RestaurantsFoursequareServices-Unit-Tests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsFoursquareServices
import RestaurantsHTTPServices
import XCTest

class PlacesServicesBackendTests : XCTestCase {
    
    func testVenuesSearch() {
        let request = VenuesSearch.Request(lat: 40.7099, lng: -73.9622, radius: 10000, categoryIds: ["4bf58dd8d48988d1c4941735"])
        
        let httpService: HTTPService = URLSession(configuration: .default)
        
        let completed = expectation(description: "Request completed")
        _ = httpService.schedule(VenuesSearch.self, request) { (result) in
            dump(result)
            completed.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
}
