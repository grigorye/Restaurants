//
//  HTTPService.swift
//  RestaurantsFoursquareServices
//
//  Created by Grigory Entin on 22/05/2019.
//

import Foundation

public protocol HTTPRequest {
    var url: URL { get }
    var httpHeaders: [String : String] { get }
}

public protocol HTTPResponse {
    init(data: Data) throws
}

public protocol HTTPAction {
    associatedtype Request: HTTPRequest
    associatedtype Response: HTTPResponse
}

public protocol HTTPRequestCancellationToken {
    func cancel()
}

public protocol HTTPService {
    
    func schedule(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> HTTPRequestCancellationToken
}

extension HTTPService {
    
    public func schedule<Action, Request, Response>(_: Action.Type, _ request: Request, completion: @escaping (Result<Response, Error>) -> Void) -> HTTPRequestCancellationToken where Action: HTTPAction, Action.Response == Response, Action.Request == Request {
        
        var urlRequest = URLRequest(url: request.url)
        for (k, v) in request.httpHeaders {
            urlRequest.addValue(v, forHTTPHeaderField: k)
        }
        
        return self.schedule(urlRequest) { (httpRequestResult) in
            let result = httpRequestResult.flatMap { (data) in
                return Result(catching: {
                    try Response(data: data)
                })
            }
            completion(result)
        }
    }
}
