//
//  Collection+Extension.swift
//  SwiftHelper
//

import Foundation

public extension Collection{
    // MARK: Array Sort by keyPath
    func sorted<Value: Comparable>(
        by keyPath: KeyPath<Element, Value>,
        _ comparator: (_ lhs: Value, _ rhs: Value)->Bool) -> [Element] {
            return self.sorted{
                comparator($0[keyPath: keyPath], $1[keyPath: keyPath])
            }
        }
    
    // MARK: Diff by keyPath
    func diff<Value: Comparable, D>(from diff: [D], compareKey compareKeyPath: KeyPath<D, Value>,
                                    ownKey keyPath: KeyPath<Element, Value>) -> [Self.Element] {
        guard !diff.isEmpty else { return [] }
        
        let difference = self.filter({ currentObject in
            (diff.contains(where: { $0[keyPath: compareKeyPath] == currentObject[keyPath: keyPath] }))
        })
        return difference
    }
}

public extension Sequence {
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



public extension Dictionary {
    init<S>(_ values: S, uniquelyKeyedBy keyPath: KeyPath<S.Element, Key>) where S : Sequence, S.Element == Value {
        let keys = values.map { $0[keyPath: keyPath] }

        self.init(uniqueKeysWithValues: zip(keys, values))
    }
}


// MARK: Unordered example
public extension Sequence {
    func merge<T: Sequence, U: Hashable>(mergeWith: T, uniquelyKeyedBy: KeyPath<T.Element, U>) -> [Element] where T.Element == Element {
        let dictOld = Dictionary(self, uniquelyKeyedBy: uniquelyKeyedBy)
        let dictNew = Dictionary(mergeWith, uniquelyKeyedBy: uniquelyKeyedBy)

        return dictNew.merging(dictOld, uniquingKeysWith: { old, new in old }).map { $0.value }
    }
}

// MARK: Ordered example
public extension Array {
    mutating func mergeWithOrdering<U: Hashable>(mergeWith: Array, uniquelyKeyedBy: KeyPath<Array.Element, U>) {
        let dictNew = Dictionary(mergeWith, uniquelyKeyedBy: uniquelyKeyedBy)

        for (key, value) in dictNew {
            guard let index = firstIndex(where: { $0[keyPath: uniquelyKeyedBy] == key }) else {
                append(value)
                continue
            }

            self[index] = value
        }
    }
}


