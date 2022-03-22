//
//  Encodable+Extension.swift
//  SwiftHelper
//

import Foundation


public extension Encodable {
    func toJSONString() -> String? {
        return JSONEncoder.encode(from: self)
    }
}

public extension JSONEncoder {
    static func encode<T: Encodable>(from data: T) -> String? {
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            let json = try jsonEncoder.encode(data)
            let jsonString = String(data: json, encoding: .utf8)
            return jsonString
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
