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
