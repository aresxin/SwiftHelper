
import Foundation
import UIKit

@resultBuilder
public struct AnyBuilder<T> {
    public typealias Component = [T]
    public typealias Expression = T

    static public func buildExpression(_ expression: Expression) -> Component {
        return [expression]
    }

    static public func buildOptional(_ component: Component?) -> Component {
        guard let array = component else { return [] }
        return array
    }

    static public func buildEither(first component: Component) -> Component {
        return component
    }

    static public func buildEither(second component: Component) -> Component {
        return component
    }

    static public func buildArray(_ components: [Component]) -> Component {
        return Array(components.joined())
    }

    static public func buildBlock(_ components: Component...) -> Component {
        return Array(components.joined())
    }
}



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
