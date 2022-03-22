//
//  Collection+Extension.swift
//  SwiftHelper
//

import Foundation

// Array Sort by keyPath
extension Collection{
    func sorted<Value: Comparable>(
        by keyPath: KeyPath<Element, Value>,
        _ comparator: (_ lhs: Value, _ rhs: Value)->Bool) -> [Element]{
            return self.sorted{
                comparator($0[keyPath: keyPath], $1[keyPath: keyPath])
            }
        }
}

extension Sequence {
    func toDictionary<Key: Hashable, Value>(where closure: (Element) -> (Key, Value)) -> [Key: Value] {
        reduce(into: [Key: Value]()) { (result, element) in
            let components = closure(element)
            result[components.0] = components.1
        }
    }
    
    func toCompactDictionary<Key: Hashable, Value>(where closure: (Element) -> ((Key, Value)?)) -> [Key: Value] {
        reduce(into: [Key: Value]()) { (result, element) in
            guard let components = closure(element) else { return }
            result[components.0] = components.1
        }
    }
}


