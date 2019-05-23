//
//  AppDelegate.swift
//  Restaurants
//
//  Created by Grigory Entin on 19/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsIntegration
import RestaurantsModels
import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    let userLocationPermissionController = UserLocationPermissionController()
    lazy var mapViewController = newMapViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        userLocationPermissionController.requestUserLocationAuthorization()
        
        navigationController.viewControllers = [mapViewController]
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        
        return true
    }

    private func newMapViewController() -> UIViewController {
        let restaurantSelectionHandler: RestaurantSelectionHandler = { [weak self] (restaurantID) in
            if let restaurantID = restaurantID {
                self?.presentDetails(forRestaurantID: restaurantID)
            } else {
                self?.dismissPresentedDetailsIfAny()
            }
        }
        
        return RestaurantsIntegration.newMapViewController(restaurantSelectionHandler: restaurantSelectionHandler)
    }
    
    private var splitViewController: UISplitViewController {
        let splitViewController = window!.rootViewController as! UISplitViewController
        return splitViewController
    }
    
    private var navigationController: UINavigationController {
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        return navigationController
    }
    
    private var presentingViewController: UIViewController {
        return navigationController
    }
    
    private func presentDetails(forRestaurantID restaurantID: RestaurantID) {
        let detailsViewController = RestaurantsIntegration.newDetailsViewController(forRestaurantID: restaurantID)
        presentingViewController.showDetailViewController(detailsViewController, sender: nil)
        self.presentedDetailsViewController = detailsViewController
    }
    
    private func dismissPresentedDetailsIfAny() {
        if self.presentedDetailsViewController != nil {
            presentingViewController.dismiss(animated: true)
            self.presentedDetailsViewController = nil
        }
    }
    
    private var presentedDetailsViewController: UIViewController?
}
