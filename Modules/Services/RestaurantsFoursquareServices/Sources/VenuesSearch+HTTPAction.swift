//
//  VenuesSearch+HTTPAction.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
//

import RestaurantsHTTPServices
import Foundation

extension VenuesSearch: HTTPAction {}

extension VenuesSearch.Request : HTTPRequest {
    
    var urlComponents: URLComponents {
        var components = baseURLComponents
        components.path = "/v2/venues/search"
        components.queryItems = [
            .init(name: "ll", value: "\(lat),\(lng)"),
            .init(name: "intent", value: "browse"),
            .init(name: "radius", value: "\(radius)"),
            .init(name: "limit", value: "50"),
            .init(name: "categoryId", value: categoryIds.joined(separator: ","))
        ] + (components.queryItems ?? [])
        return components
    }
    
    public var httpHeaders: [String : String] {
        return baseRequestHTTPHeaders
    }
    
    public var url: URL {
        return urlComponents.url!
    }
}

extension VenuesSearch.Response : HTTPResponse {
    
    public init(data: Data) throws {
        self = try JSONDecoder().decode(type(of: self), from: data)
    }
}
