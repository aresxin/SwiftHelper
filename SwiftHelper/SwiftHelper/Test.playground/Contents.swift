import UIKit

var greeting = "Hello, playground"

struct Person: Codable {
    let age: Int
    let name: String
}

let person = [Person(age: 10, name: "ad"), Person(age: 50, name: "asd"), Person(age: 3, name: "ojo")]

// Extension Array sort
let sort = person.sorted(by: \.age, <)
let sortName = person.sorted(by: \.name, >)

// Extension Array to Dictionary
let dic = person.toDictionary { p in
    return (p.name, p)
}


// Extension Encodable
let jsonString = Person(age: 10, name: "ad").toJSONString()


// Extension URL
var url = URL(string: "https://www.example.com")!
url.appendQueryItem(name: "name", value: "bhuvan")


