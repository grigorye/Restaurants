//
//  RestaurantDetails.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
//

public struct RestaurantDetails {
    public let name: String
    public let addressLines: [String]
    
    public init(name: String, addressLines: [String]) {
        self.name = name
        self.addressLines = addressLines
    }
}
