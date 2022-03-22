//
//  UIButton+Extension.swift
//  SwiftHelper
//

import UIKit

public extension UIButton {
    
    /*
     Set image with image name and tint color
     */
    @discardableResult
    func setImage(named name: String, tintColor: UIColor, for state: UIControl.State = .normal) -> Self {
        // Image render mode must be alwaysTemplate, button can set tint color
        let image = UIImage(named: name)?.withRenderingMode(.alwaysTemplate)
        setImage(image, for: state)
        self.tintColor = tintColor
        return self
    }
    
    
    /*
     set image with image name
     */
    @discardableResult
    func setImage(named name: String, for state: UIControl.State = .normal) -> Self {
        setImage(UIImage(named: name), for: state)
        return self
    }
}
