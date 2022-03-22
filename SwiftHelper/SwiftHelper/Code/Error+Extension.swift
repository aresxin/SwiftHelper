//
//  Error+Extension.swift
//  SwiftHelper
//

import Foundation

public extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
