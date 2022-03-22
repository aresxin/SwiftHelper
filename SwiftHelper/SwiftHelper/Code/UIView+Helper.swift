//
//  ViewController.swift
//  SwiftHelper
//
//

import UIKit

public extension UIView
{
    @IBInspectable var roundCorner: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var roundColor: UIColor {
        get {
            return UIColor(cgColor:layer.borderColor!)
        }
        
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var roundWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
}


/*
 * https://stackoverflow.com/questions/17572304/get-position-of-uiview-in-respect-to-its-superviews-superview
 */
public extension UIView {
    static func getConvertedPoint(_ targetView: UIView, baseView: UIView) -> CGPoint {
        var pnt = targetView.frame.origin
        if nil == targetView.superview{
            return pnt
        }
        var superView = targetView.superview
        while superView != baseView{
            pnt = superView!.convert(pnt, to: superView!.superview)
            if nil == superView!.superview{
                break
            }else{
                superView = superView!.superview
            }
        }
        return superView!.convert(pnt, to: baseView)
    }
    
    static func getConvertedRect(_ targetView: UIView, baseView: UIView) -> CGRect {
        let point = getConvertedPoint(targetView, baseView: baseView)
        return CGRect(x: point.x, y: point.y, width: targetView.frame.size.width, height: targetView.frame.size.height)
    }
}


// MARK: Add Child
public extension UIView {
    func fit(parentView: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.topAnchor),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor)
        ])
    }
    
    func fit(parentView: UIView, insets: UIEdgeInsets) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: insets.bottom),
            leftAnchor.constraint(equalTo: parentView.leadingAnchor, constant: insets.left),
            rightAnchor.constraint(equalTo: parentView.trailingAnchor, constant: insets.right)
        ])
    }

    func fitSafeArea(parentView: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor),
            leadingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
    
public extension UIViewController {
    var isControllerActive: Bool {
        return view.window != nil
    }
    
    func addChild(viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    func removeChild(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
