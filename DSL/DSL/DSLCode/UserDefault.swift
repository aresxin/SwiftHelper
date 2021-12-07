

import Foundation

@propertyWrapper
struct UserDefault<Value, NonOptional> {
    let key: String
    
    let defaultValue: Value
    
    var storage: UserDefaults = .standard

    // MARK: - @propertyWrapper
    var wrappedValue: Value {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set {
            storage.setValue(newValue, forKey: key)
        }
    }
}
