//
//  FoursquareRestaurantDetailsProvider.swift
//  RestaurantsIntegration
//
//  Created by Grigory Entin on 22/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsModels
import RestaurantsHTTPServices
import RestaurantsFoursquareServices

class FoursquareRestaurantDetailsProvider : RestaurantDetailsProvider {
    
    let httpService: HTTPService
    let restaurantID: RestaurantID
    
    init(restaurantID: RestaurantID, httpService: HTTPService = URLSession(configuration: .default)) {

        self.restaurantID = restaurantID
        self.httpService = httpService
    }
    
    func details(completion: @escaping (Result<RestaurantDetails, Error>) -> Void) {

        let request = VenueDetails.Request(venueID: restaurantID)
        
        _ = httpService.schedule(VenueDetails.self, request) { (result) in
            dump(result)
            completion(result.map { (venueDetailsResponse: VenueDetails.Response) in
                let venue = venueDetailsResponse.response.venue
                let name = venue.name
                let addressLines = venue.location.formattedAddress ?? []
                return RestaurantDetails(name: name, addressLines: addressLines)
            })
        }
    }
}
