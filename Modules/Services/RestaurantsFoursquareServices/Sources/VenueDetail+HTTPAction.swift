//
//  VenueDetails+HTTPAction.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
//

import RestaurantsHTTPServices
import Foundation

extension VenueDetails: HTTPAction {}

extension VenueDetails.Request : HTTPRequest {
    
    var urlComponents: URLComponents {
        var components = baseURLComponents
        components.path = "/v2/venues/\(venueID)"
        return components
    }
    
    public var url: URL {
        return urlComponents.url!
    }
}

extension VenueDetails.Response : HTTPResponse {
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(type(of: self), from: data)
    }
}
