//
//  ServiceURLs.swift
//  RestaurantsFoursequareServices
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsHTTPServices
import Foundation

private let baseURLString = "https://api.foursquare.com"

let baseURLComponents: URLComponents = {
    var components = URLComponents(string: baseURLString)!
    components.queryItems = [
        .init(name: "client_id", value: "BCTNSBGBRCNZYAZM40QOIWS1ULXPXKJUGFC03ALBFUIS4RY2"),
        .init(name: "client_secret", value: "C5GC4UXA0VLQQ0RBKP1A4D1FWWAZ3MTUF2DO5R4IHIXWRFTT"),
        .init(name: "v", value: "20190425")
    ]
    return components
}()

let baseRequestHTTPHeaders: [String : String] = [
    "Content-Type": "application/json",
    "Accept": "application/json"
]

extension HTTPRequest {
    
    public var httpHeaders: [String : String] {
        return baseRequestHTTPHeaders
    }
}
