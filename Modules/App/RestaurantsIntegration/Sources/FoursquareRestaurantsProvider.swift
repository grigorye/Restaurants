//
//  FoursquareRestaurantsProvider.swift
//  RestaurantsIntegration
//
//  Created by Grigory Entin on 22/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsModels
import RestaurantsHTTPServices
import RestaurantsFoursquareServices

class FoursquareRestaurantsProvider : RestaurantsProvider {
    
    let httpService: HTTPService
    
    init(httpService: HTTPService = URLSession(configuration: .default)) {
        self.httpService = httpService
    }
    
    func restaurants(for query: RestaurantQuery, completion: @escaping (Result<[Restaurant], Error>) -> Void) {

        let region = query.region
        let radius = region.radius
        let request = VenuesSearch.Request(lat: region.center.latitude, lng: region.center.longitude, radius: radius, categoryIds: ["4bf58dd8d48988d1c4941735"])
        
        _ = httpService.schedule(VenuesSearch.self, request) { (result) in
            dump(result)
            completion(result.map { (venuesSearchResponse: VenuesSearch.Response) in
                let venues = venuesSearchResponse.response.venues
                return venues.map { (venue) in
                    let location = Location(latitude: venue.location.lat, longitude: venue.location.lng)
                    let name = venue.name
                    return Restaurant(id: venue.id, location: location, name: name)
                }
            })
        }
    }
}
