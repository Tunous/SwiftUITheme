# SwiftUITheme

Theming system for SwiftUI.

## Example

The library aims to make accessing themed colors as easy to use as possible. Once configured you'll be able to use themed colors similarly to regular SwiftUI colors with modifiers like `foregroundColor`, `fill`, etc.
Code below lists a few examples of what you can do with this library.

```swift
import SwiftUI
import SwiftUITheme

struct ContentView: View {
    // Read current theme from environment
    @Environment(\.theme) private var theme

    var body: some View {
        // Access any value from theme
        Text("Current theme is \(theme.name)")

        // Use colors from theme as if they were regular colors (no need to read theme from environment)
        Text("Hello").foregroundColor(.colorFromTheme)

        VStack {
            Rectangle().fill(.otherColorFromTheme)
        }
        .theme(.differentTheme) // Override theme for specific view hierarchy
    }
}
```

## Copy paste snippet

The following code snippet lists minimal code needed to configure the library. You can copy and paste it to your project filling in necessary details.

- <#default theme#> - instance of your theme that should be used by default
- <#color from theme#> - Color property from your theme that you'll want to easily access

For all the details and other ways to define themes see documentation.

```swift
import SwiftUI
import SwiftUITheme

struct Theme {
    let <#color from theme#>: Color
}

extension Theme: BaseTheme {
    static let defaultValue: Theme = <#default theme#>
    static let environmentValue: WritableKeyPath<EnvironmentValues, Theme> \.theme
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[Theme.self] }
        set { self[Theme.self] = newValue }
    }
}

extension ThemeColor where Self == ThemeColor<Theme> {
    static var <#color from theme#>: Self { Self(\.<#color from theme#>) }
}
```

## License

SwiftUITheme is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
