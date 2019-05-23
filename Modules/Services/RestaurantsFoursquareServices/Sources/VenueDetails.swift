//
//  VenueDetails.swift
//  RestaurantsFoursequareServices
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

public enum VenueDetails {
    
    public struct Request : Codable {
        let venueID: String
        
        public init(venueID: String) {
            self.venueID = venueID
        }
    }
    
    public struct Response : Codable {
        public let response: Response
        
        public struct Response : Codable {
            public let venue: Venue
            
            public struct Venue : Codable {
                public let id: String
                public let name: String
                public let location: Location
                
                public struct Location : Codable {
                    public let address: String?
                    public let lat: Double?
                    public let lng: Double?
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
