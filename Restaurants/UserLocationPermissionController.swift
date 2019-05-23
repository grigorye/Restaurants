//
//  UserLocationPermissionController.swift
//  Restaurants
//
//  Created by Grigory Entin on 23/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import CoreLocation
import Foundation

class UserLocationPermissionController : NSObject, CLLocationManagerDelegate {

    func requestUserLocationAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK: - <CLLocationManagerDelegate>
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        dump(status)
    }
    
    // MARK: -
    
    private let locationManager = CLLocationManager()
}
