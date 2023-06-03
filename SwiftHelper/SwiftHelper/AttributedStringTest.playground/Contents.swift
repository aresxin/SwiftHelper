import UIKit

var greeting = "Hello, playground"

let build = NSAttributedString {
    Text("Start").color(.red)
    SpecialCharacters.space
    Text("End").color(.yellow).font(.boldSystemFont(ofSize: 18))
}


let build1 = NSMutableAttributedString()
let start = NSAttributedString(string: "Start", attributes: [
    NSAttributedString.Key.foregroundColor: UIColor.red
])
build1.append(start)
build1.append(NSAttributedString(string: " "))
let end = NSAttributedString(string: "End", attributes: [
    NSAttributedString.Key.foregroundColor: UIColor.yellow,
    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
])
build1.append(end)

