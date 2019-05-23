//
//  DetailsViewModel.swift
//  Pods
//
//  Created by Grigory Entin on 23/05/2019.
//

public struct DetailsViewModel {
    
    let name: String
    let addressLines: [String]
    
    public init(name: String, addressLines: [String]) {
        self.name = name
        self.addressLines = addressLines
    }
}
