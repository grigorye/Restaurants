//
//  Dictionary+SetReusingValues.swift
//  RestaurantsAlgorithms
//
//  Created by Grigory Entin on 21/05/2019.
//  Copyright © 2019 Grigory Entin. All rights reserved.
//

extension Dictionary {

    /// Sets the receiver reusing the values for existing keys, and generating the values for the missing keys.
    public mutating func setReusingValues(forKeys updatedKeys: [Key], missingValueGenerator: (Key) -> Value) -> (removedValues: [Value], addedValues: [Value]) {
    
        // Account removed values
        let removedKeys = self.keys.filter { !updatedKeys.contains($0) }
        let removedValues: [Value] = removedKeys.compactMap { (key) in
            assert(nil != self[key])
            return self.removeValue(forKey: key)
        }
        
        // Account added values
        let addedKeys = updatedKeys.filter { !self.keys.contains($0) }
        let addedValues: [Value] = addedKeys.map { (key) in
            let addedValue = missingValueGenerator(key)
            self[key] = addedValue
            return addedValue
        }
        
        return (removedValues: removedValues, addedValues: addedValues)
    }
}
