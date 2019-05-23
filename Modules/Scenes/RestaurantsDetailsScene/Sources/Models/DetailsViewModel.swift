//
//  DetailsViewModel.swift
//  RestaurantsDetailsScene
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

public struct DetailsViewModel {
    
    let name: String
    let addressLines: [String]
    
    public init(name: String, addressLines: [String]) {
        self.name = name
        self.addressLines = addressLines
    }
}
