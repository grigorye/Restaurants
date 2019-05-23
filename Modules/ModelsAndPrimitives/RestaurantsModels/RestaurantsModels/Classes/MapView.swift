//
//  MapView.swift
//  Pods
//
//  Created by Grigory Entin on 23/05/2019.
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
