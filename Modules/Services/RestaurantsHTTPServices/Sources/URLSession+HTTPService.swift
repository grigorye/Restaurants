//
//  URLSession+HTTPService.swift
//  RestaurantsHTTPServices
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

import Foundation

extension URLSession : HTTPService {
    
    public func schedule(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> HTTPRequestCancellationToken {
        
        let dataTask = self.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(.init(catching: { () -> Data in
                    enum Error : Swift.Error {
                        case noData
                        case badResponse
                        case badHTTPStatus(Int)
                    }
                    
                    if let error = error {
                        throw error
                    }
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw Error.badResponse
                    }
                    guard let data = data else {
                        throw Error.noData
                    }
                    guard (200 ..< 300) ~= httpResponse.statusCode else {
                        let errorBody = String(data: data, encoding: .utf8)!
                        dump(errorBody)
                        throw Error.badHTTPStatus(httpResponse.statusCode)
                    }
                    return data
                }))
            }
        }
        dataTask.resume()
        return dataTask
    }
}

extension URLSessionDataTask : HTTPRequestCancellationToken {}
