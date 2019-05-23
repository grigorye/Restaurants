//
//  MapItem.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
//

public struct MapItem : Hashable {
    
    public typealias Identifier = String
    
    public var identifier: Identifier
    public var location: Location
    public var title: String
    
    public init(identifier: Identifier, location: Location, title: String) {
        self.identifier = identifier
        self.location = location
        self.title = title
    }
}
