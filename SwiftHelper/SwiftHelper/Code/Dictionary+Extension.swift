//
//  Dictionary+Extensio.swift
//  SwiftHelper
//

import Foundation

/**
 convert dictionary to object
 */

public extension Dictionary where Key == String, Value: Any {
    func toObject<T: Decodable>() -> T? {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: []) {
            return try? JSONDecoder().decode(T.self, from: data)
        } else {
            return nil
        }
    }
}
