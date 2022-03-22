import UIKit

var greeting = "Hello, playground"

extension UserDefaults {
    @UserDefault(key: "username", defaultValue: "Antoine van der Lee")
    static var username: String
}

let subscription = UserDefaults.$username.sink { username in
    print("New username: \(username)")
}
UserDefaults.username = "Test"
