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


// Extension Array Merge
struct SomeStruct: Hashable {
    let id: Int
    let name: String
}

let someStruct1 = SomeStruct(id: 1, name: "1")
let someStruct2 = SomeStruct(id: 2, name: "2")
let someStruct3 = SomeStruct(id: 2, name: "3")
let someStruct4 = SomeStruct(id: 4, name: "4")

var arrayA = [someStruct1, someStruct2]
let arrayB = [someStruct3, someStruct4]

let arrayMerge = arrayA.merge(mergeWith: arrayB, uniquelyKeyedBy: \.id)

arrayA.mergeWithOrdering(mergeWith: arrayB, uniquelyKeyedBy: \.id)
