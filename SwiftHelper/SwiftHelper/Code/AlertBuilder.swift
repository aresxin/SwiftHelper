import UIKit

public struct Action {
    public let title: String
    public let style: UIAlertAction.Style
    public let action: () -> Void
}

public extension Action {
    static func `default`(_ title: String, action: @escaping () -> Void) -> Action {
        return Action(title: title, style: .default, action: action)
    }

    static func destructive(_ title: String, action: @escaping () -> Void) -> Action {
        return Action(title: title, style: .destructive, action: action)
    }

    static func cancel(_ title: String, action: @escaping () -> Void = {}) -> Action {
        return Action(title: title, style: .cancel, action: action)
    }
}

public typealias ActionBuilder = AnyBuilder<Action>

public func makeAlertController(title: String?,
                         message: String?,
                         style: UIAlertController.Style,
                         actions: [Action]) -> UIAlertController {
    let controller = UIAlertController(
        title: title,
        message: message,
        preferredStyle: style
    )
    for action in actions {
        let uiAction = UIAlertAction(title: action.title, style: action.style) { _ in
            action.action()
        }
        controller.addAction(uiAction)
    }
    return controller
}

public func Alert(title: String? = nil,
           message: String? = nil,
           @ActionBuilder _ makeActions: () -> [Action]) -> UIAlertController {
    makeAlertController(
        title: title,
        message: message,
        style: .alert,
        actions: makeActions()
    )
}

public func ActionSheet(title: String? = nil,
                 message: String? = nil,
                 @ActionBuilder _ makeActions: () -> [Action]) -> UIAlertController {
    makeAlertController(
        title: title,
        message: message,
        style: .actionSheet,
        actions: makeActions()
    )
}
