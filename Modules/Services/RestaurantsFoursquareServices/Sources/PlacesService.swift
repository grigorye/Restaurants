//
//  PlacesService.swift
//  Pods
//
//  Created by Grigory Entin on 19/05/2019.
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
