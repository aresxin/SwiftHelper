//
//  ViewController.swift
//  SwiftHelper
//
//

import Foundation
import UIKit


public typealias BC = ButtonComponent
public enum ButtonComponent {
    case title(String?, UIControl.State)
    case color(UIColor?, UIControl.State)
    case image(UIImage?, UIControl.State)
}

public typealias ButtonBuilder = AnyBuilder<ButtonComponent>

public extension UIButton {
    func config(@ButtonBuilder _ builder: () -> [ButtonComponent]) {
        for one in builder() {
            switch one {
            case .color(let color, let state):
                setTitleColor(color, for: state)
            case .image(let image, let state):
                setImage(image, for: state)
            case .title(let title, let state):
                setTitle(title, for: state)
            }
        }
    }
}
