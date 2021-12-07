

import Foundation

extension NSCoding {
    @inlinable
    func encode(_ requiringSecureCoding: Bool = false) throws -> Data {
        let data: Data
        do {
            if #available(iOS 11.0, *) {
                data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: requiringSecureCoding)
            } else {
                data = NSKeyedArchiver.archivedData(withRootObject: self)
            }
        } catch let error {
            throw error
        }
        return data
    }
    
    @inlinable
    static func decode(data: Data) throws -> Self? {
        do {
            guard let r = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Self else {
                return nil
            }
            return r
        } catch let error {
            throw error
        }
    }
}


extension Array where Element: NSCoding {
    @inlinable
    func encode(_ requiringSecureCoding: Bool = false) throws -> Data {
        let data: Data
        do {
            if #available(iOS 11.0, *) {
                data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: requiringSecureCoding)
            } else {
                data = NSKeyedArchiver.archivedData(withRootObject: self)
            }
        } catch let error {
            throw error
        }
        return data
    }
    
    
    @inlinable
    static func decode(data: Data) throws -> [Element]? {
        do {
            guard let r = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Element] else {
                return nil
            }
            return r
        } catch let error {
            throw error
        }
    }
}

extension Dictionary where Value: NSCoding {
    @inlinable
    func encode(_ requiringSecureCoding: Bool = false) throws -> Data {
        let data: Data
        do {
            if #available(iOS 11.0, *) {
                data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: requiringSecureCoding)
            } else {
                data = NSKeyedArchiver.archivedData(withRootObject: self)
            }
        } catch let error {
            throw error
        }
        return data
    }
    
    @inlinable
    static func decode(data: Data) throws -> Dictionary<Key, Value>? {
        do {
            guard let r = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as?  Dictionary<Key, Value> else {
                return nil
            }
            return r
        } catch let error {
            throw error
        }
    }
}
