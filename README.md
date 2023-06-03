# SwiftHelper

Convenience classes wrapped with Swift features and useful Swift extensions

## AttributedStringBuilder

<img width="103" alt="Screenshot 2023-06-03 at 21 38 06" src="https://github.com/aresxin/SwiftHelper/assets/12081433/43c32ba7-fb18-4145-b1f5-a3bb291236c7">

Before:
```
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
```

Now:
```
let build = NSAttributedString {
    Text("Start").color(.red)
    SpecialCharacters.space
    Text("End").color(.yellow).font(.boldSystemFont(ofSize: 18))
}
```
