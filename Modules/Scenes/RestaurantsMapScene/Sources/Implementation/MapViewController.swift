//
//  MapViewController.swift
//  RestaurantsMapScene
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsAlgorithms
import MapKit
import UIKit

extension MapViewController {
    
    public static func instantiatedFromStoryboard() -> MapViewController {
        let storyboardName = "Map"
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        let viewController = storyboard.instantiateInitialViewController()!
        return viewController as! MapViewController
    }
}

extension MapViewController : MapView {
    
    var visibleRegion: MapRegion {
        let visibleRegion = MapRegion(
            center: Location(from: mapView.region.center),
            radius: mapView.visibleRadius()
        )
        return visibleRegion
    }
    
    var selection: MapSelection {
        guard let annotation = mapView.selectedAnnotations.last as? MapItemAnnotation else {
            return .none
        }
        return .item(identifier: annotation.mapItem.identifier)
    }
    
    func setItems(_ items: [MapItem]) {
        
        let (annotationsToRemove, annotationsToAdd) = currentAnnotationsByItems.setReusingValues(forKeys: items, missingValueGenerator: MapItemAnnotation.init)
        
        mapView.removeAnnotations(annotationsToRemove)
        mapView.addAnnotations(annotationsToAdd)
    }
}

class MapViewController : UIViewController {
    
    weak var delegate: MapViewDelegate?
    
    private var currentAnnotationsByItems: [MapItem : MKAnnotation] = [:]

    @IBOutlet var userTrackingButtonContainerView: UIView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let userTrackingButton = MKUserTrackingButton(mapView: mapView)
        userTrackingButton.frame = userTrackingButtonContainerView.bounds
        userTrackingButtonContainerView.addSubview(userTrackingButton)
    }
    
    deinit {()}
    
    init() {
        fatalError()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet private var mapViewImp: MKMapView! {
        didSet {
            mapViewImp.delegate = self
        }
    }
    
    var mapView: MKMapView {
        _ = view
        return mapViewImp!
    }
    
    #if DEBUG
    private(set) var mapViewDidFinishRendering: Bool = false
    private var mapViewDidFinishRenderingTimer: Timer?
    #endif
}

extension MapViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        delegate?.mapViewSelectionDidChange(self)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        delegate?.mapViewVisibleRegionDidChange(self)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        delegate?.mapViewVisibleRegionDidChange(self)
    }
    
    #if DEBUG
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        dump(mapViewDidFinishRenderingTimer)?.invalidate()
        mapViewDidFinishRenderingTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            self.mapViewDidFinishRendering = fullyRendered
        }
    }
    #endif
}
