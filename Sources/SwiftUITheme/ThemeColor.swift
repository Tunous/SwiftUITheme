import SwiftUI

/// A type that reads single `Color` value from a type conforming to `BaseTheme` protocol.
///
/// This type allows you to style views using colors that change depending on active theme in view environment.
/// All you have to do is to pass `ThemeColor` instead of `Color` to various view modifiers like:
///
/// ```swift
/// Rectangle().fill(ThemeColor(\Theme.color))
/// Rectangle().fill(\Theme.color)
/// ```
///
/// You can additionally extend this type with custom properties to make theme colors easier to use in views.
/// For example if you had a `Theme` type with `color` property you could extend this type as follows:
///
/// ```swift
/// extension ThemeColor where Self == ThemeColor<Theme> {
///     static var color: Self { Self(\.color) }
/// }
/// ```
///
/// Extension like above would allow you to use following syntax to style your views:
///
/// ```swift
/// Rectangle().fill(.color)
/// ```
public struct ThemeColor<Theme: BaseTheme> {
    private let keyPath: KeyPath<Theme, Color>

    /// Create a theme color that will read a single color using given `keyPath`.
    public init(_ keyPath: KeyPath<Theme, Color>) {
        self.keyPath = keyPath
    }

    /// Resolve and return a color using the given `theme`.
    public func resolve(for theme: Theme) -> Color {
        return theme[keyPath: keyPath]
    }
}
