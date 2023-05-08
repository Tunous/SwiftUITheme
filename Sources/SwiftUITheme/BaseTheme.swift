import SwiftUI

/// Core protocol of the theming system.
///
/// You can create your own theme type by conforming to this protocol.
/// To do so declare `defaultValue` and `environmentValue` properties and extend `EnvironmentValues` with property
/// which will be used to access that theme. For example:
///
/// ```swift
/// struct Theme: BaseTheme {
///     let color: Color
///
///     static let defaultValue: Theme = Theme(color: .red)
///     static let environmentValue: WritableKeyPath<EnvironmentValues, Theme> = \.theme
/// }
///
/// extension EnvironmentValues {
///     var theme: Theme {
///         get { self[Theme.self] }
///         set { self[Theme.self] = newValue }
///     }
/// }
/// ```
///
/// This allows you to then access your theme from views using `Environment` property wrapper.
///
/// ```swift
/// struct ContentView: View {
///     @Environment(\.theme) private var theme
///
///     var body: some View {
///         Rectangle().fill(theme.color)
///     }
/// }
/// ```
///
/// And you can modify theme in view hierarchy by using `View.theme(_:)` extension.
///
/// ```swift
/// VStack {
///     // ...
/// }
/// .theme(Theme(color: .blue))
/// ```
public protocol BaseTheme: EnvironmentKey where Value == Self {

    /// Key path to a theme value in SwiftUI environment.
    ///
    /// This should point to a property in `EnvironmentValues` with read and write access to your theme.
    /// For example `\.theme` would work if you added extension as below:
    ///
    /// ```swift
    /// extension EnvironmentValues {
    ///     var theme: Theme {
    ///         get { self[Theme.self] }
    ///         set { self[Theme.self] = newValue }
    ///     }
    /// }
    /// ```
    static var environmentValue: WritableKeyPath<EnvironmentValues, Self> { get }
}
