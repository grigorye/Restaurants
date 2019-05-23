//
//  HTTPServiceTests.swift
//  RestaurantsHTTPServices-Unit-Tests
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

@testable import RestaurantsHTTPServices
import SwiftCheck
import XCTest

class HTTPServiceTests: XCTestCase {

    func testPropertiesOfSchedule() {
        
        property("") <- forAll() { (request: FakeAction.Request, nextResult: Result<FakeActionResponseSample, Error>) in
        
            let service = FakeHTTPService()
            service.nextResult = nextResult.map { $0.data }
        
            var observedActionResultOrNil: Result<FakeAction.Response, Error>?
            
            _ = service.schedule(FakeAction.self, request) { (actionResult) in
                observedActionResultOrNil = actionResult
            }
            
            guard let observedActionResult = observedActionResultOrNil else {
                return false <?> "Completes"
            }
            
            return (true <?> "Completes")
                ^&&^ (!observedActionResult.isFailure ? true : (nextResult.isFailure || (nextResult.successValue?.data.elementsEqual(FakeAction.Response.badData) ?? false))) <?> "ReportsFailure"
        }
    }
}

extension URL : Arbitrary {
    public static var arbitrary: Gen<URL> {
        return .compose { (c) in URL(string: "https://www.apple.com/")! }
    }
}
enum FakeAction : HTTPAction {
    
    struct Request : HTTPRequest, Arbitrary {
        let url: URL

        static var arbitrary: Gen<FakeAction.Request> {
            return .compose { (c) in
                .init(url: c.generate())
            }
        }
    }
    
    struct Response : HTTPResponse {
        static let badData = "bad".data(using: .utf8)!
        static let goodData = "good".data(using: .utf8)!
        
        enum Error: Swift.Error {
            case badData
        }
        
        init(data: Data) throws {
            guard data != type(of: self).badData else {
                throw Error.badData
            }
        }
    }
}

struct FakeActionResponseSample: Arbitrary {
    let data: Data
    
    public static var arbitrary: Gen<FakeActionResponseSample> {
        let generators: [Gen<FakeActionResponseSample>] = [
            .pure(FakeActionResponseSample(data: FakeAction.Response.goodData)),
            .pure(FakeActionResponseSample(data: FakeAction.Response.badData))
        ]
        return .one(of: generators)
    }
}

class FakeHTTPService : HTTPService {
    
    var nextResult: Result<Data, Error> = .failure(FakeError.fakeFailed)
    
    func schedule(_ request: URLRequest, completion: @escaping (Result<Data, Swift.Error>) -> Void) -> HTTPRequestCancellationToken {
        
        completion(self.nextResult)
        
        struct FakeCancelationToken : HTTPRequestCancellationToken {
            func cancel() {}
        }
        return FakeCancelationToken()
    }
}

extension Result {
    
    var successValue: Success? {
        switch self {
        case .success(let value):
            return value
        default:
            return nil
        }
    }
    
    var isFailure: Bool {
        switch self {
        case .failure:
            return true
        default:
            return false
        }
    }
}

extension Result : Arbitrary where Success : Arbitrary, Failure == Error {
    
    public static var arbitrary: Gen<Result<Success, Failure>> {
        let generators: [Gen<Result<Success, Failure>>] = [
            .pure(Result<Success, Failure>.failure(FakeError.fakeFailed)),
            .compose { (c) in .success(c.generate()) }
        ]
        return .one(of: generators)
    }
}

private enum FakeError: Swift.Error {
    case fakeFailed
}
