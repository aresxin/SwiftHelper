
//
//  ViewController.swift
//  SwiftHelper
//
//

import Foundation
import UIKit

public typealias Text = NSMutableAttributedString
public typealias TextImage = (UIImage, CGSize)

public extension NSAttributedString {
    convenience init(@AttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
}

public extension NSMutableAttributedString {
    convenience init(_ string: String) {
        self.init(string: string)
    }
    
    func color(_ color : UIColor) -> NSMutableAttributedString {
        self.addAttribute(NSAttributedString.Key.foregroundColor,
                          value: color,
                          range: NSRange(location: 0, length: self.length))
        return self
    }
    
    func font(_ font : UIFont) -> NSMutableAttributedString {
        self.addAttribute(NSAttributedString.Key.font,
                          value: font,
                          range: NSRange(location: 0, length: self.length))
        return self
    }
    
    func link(_ url : URL) -> NSMutableAttributedString {
        self.addAttribute(NSAttributedString.Key.link,
                           value: url,
                           range: NSRange(location: 0, length: self.length))
        return self
    }
}

public enum SpecialCharacters {
  case lineBreak
  case comma
  case space
  case tab
  case slash
  case empty
}


@resultBuilder
public enum AttributedStringBuilder {
    public static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        for component in components {
          attributedString.append(component)
        }
        return attributedString
    }
    
    public static func buildOptional(_ component: NSAttributedString?) -> NSAttributedString {
        component ?? NSAttributedString()
    }
    
    public static func buildEither(first component: NSAttributedString) -> NSAttributedString {
        component
    }
    
    public static func buildEither(second component: NSAttributedString) -> NSAttributedString {
        component
    }
    
    public static func buildArray(_ components: [NSAttributedString]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        for component in components {
            attributedString.append(component)
        }
        return attributedString
    }
    
    
    public static func buildExpression(_ expression: NSAttributedString) -> NSAttributedString {
        return expression
    }
    
    public static func buildExpression(_ expression: SpecialCharacters) -> NSAttributedString {
        switch expression {
        case .lineBreak:
            return Text("\n")
        case .comma:
            return Text(",")
        case .space:
            return Text(" ")
        case .tab:
            return Text("   ")
        case .slash:
            return Text("/")
        case .empty:
            return Text("")
        }
    }
    
    public static func buildExpression(_ expression: UIImage) -> NSAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = expression
        return NSAttributedString(attachment: attachment)
    }
    
    public static func buildExpression(_ expression: TextImage) -> NSAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = expression.0
        attachment.bounds.size = expression.1
        return NSAttributedString(attachment: attachment)
    }
}
