//
//  Dictionary+SetReusingValues.swift
//  RestaurantsAlgorithms
//
//  Created by Grigory Entin on 21/05/2019.
//

import RestaurantsAlgorithms
import SwiftCheck
import XCTest

class Dictionary_SetReusingValuesTests : XCTestCase {
    
    func testProperties() {
        
        typealias Key = UInt
        
        let generateValue: (Key) -> String = { (x) in
            return String(describing: x)
        }
        let keyFromValue: (String) -> Key = { (s) in
            return Key(s)!
        }
        
        func generateDictionary(fromKeys keys: [Key]) -> [Key : String] {
            var dictionary: [Key : String] = [:]
            for key in keys {
                dictionary[key] = generateValue(key)
            }
            return dictionary
        }
        
        property("", arguments: nil) <- forAll { (xs: [Key], ys: [Key]) in
            let xd = generateDictionary(fromKeys: xs)
            var r = xd
            let (removedValues, addedValues) = r.setReusingValues(forKeys: ys, missingValueGenerator: generateValue)
            
            let yd = generateDictionary(fromKeys: ys)

            return
                ((r == yd) <?> "Mutation")
                    ^&&^
                    (Set(addedValues) == Set(yd.values.notContained(in: xd.values))) <?> "Addition"
                    ^&&^
                    (Set(removedValues) == Set(xd.values.notContained(in: yd.values))) <?> "Removal"
        }
    }
}

extension Collection where Element : Hashable {
    
    fileprivate func notContained<C>(in otherElements: C) -> [Element] where C: Collection, C.Element == Element {
        return filter {
            !otherElements.contains($0)
        }
    }
}
