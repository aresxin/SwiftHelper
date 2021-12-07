

import UIKit
import Foundation

public protocol NibLoadable: UIView {
    static var nibName: String { get }

    static func resourceBundle() -> Bundle
}

public extension NibLoadable {
    static var nibName: String {
        return String(describing: Self.self)
    }

    static func resourceBundle() -> Bundle {
        return Bundle(for: self)
    }

    static var nib: UINib {
        return UINib(nibName: Self.nibName, bundle: resourceBundle())
    }

    @discardableResult
    func setupFromNib() -> UIView {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error loading \(Self.nibName) from nib")
        }

        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        return view
    }
}
