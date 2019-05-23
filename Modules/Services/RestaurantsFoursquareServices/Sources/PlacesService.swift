//
//  PlacesService.swift
//  RestaurantsFoursequareServices
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import RestaurantsHTTPServices
import Foundation

struct PlacesService {
    
    typealias RequestCancellationToken = HTTPRequestCancellationToken
    
    let httpService: HTTPService
    
    func venues(searchRequest: VenuesSearch.Request, completion: @escaping (Result<VenuesSearch.Response, Error>) -> Void) -> RequestCancellationToken {
        return httpService.schedule(VenuesSearch.self, searchRequest, completion: completion)
    }
}
