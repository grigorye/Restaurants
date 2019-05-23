//
//  VenuesSearch.swift
//  RestaurantsFoursquareServices
//
//  Created by Grigory Entin on 22/05/2019.
//

public enum VenuesSearch {
    
    public struct Request {
        public let lat: Double
        public let lng: Double
        public let radius: Double
        public let categoryIds: [String]
        
        public init(lat: Double, lng: Double, radius: Double, categoryIds: [String]) {
            self.lat = lat
            self.lng = lng
            self.radius = radius
            self.categoryIds = categoryIds
        }
    }
    
    public struct Response : Codable {
        public let response: Response
        
        public struct Response : Codable {
            public let venues: [Venue]
            
            public struct Venue : Codable {
                public let id: String
                public let name: String
                public let location: Location
                
                public struct Location : Codable {
                    public let address: String?
                    public let lat: Double
                    public let lng: Double
                    public let postalCode: String?
                    public let cc: String?
                    public let neighborhood: String?
                    public let city: String?
                    public let state: String?
                    public let country: String?
                    public let formattedAddress: [String]?
                }
            }
        }
    }
}
