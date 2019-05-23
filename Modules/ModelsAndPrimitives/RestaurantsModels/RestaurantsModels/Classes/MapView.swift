//
//  MapView.swift
//  RestaurantsModels
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

public protocol MapViewDelegate : AnyObject {
    
    func mapViewVisibleRegionDidChange(_ mapView: MapView)
    func mapViewSelectionDidChange(_ mapView: MapView)
}

public protocol MapView {
    
    var delegate: MapViewDelegate? { get set }
    
    func setItems(_ items: [MapItem])
    
    var visibleRegion: MapRegion { get }
    var selection: MapSelection { get }
}

public enum MapSelection {
    case none
    case item(identifier: MapItem.Identifier?)
}
