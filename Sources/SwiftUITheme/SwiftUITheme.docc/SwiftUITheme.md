# ``SwiftUITheme``

Theming system for SwiftUI.

## Overview

SwiftUITheme is a SwiftUI theming library designed in a way so you can access themed values without even noticing that they don't come natively from SwiftUI.

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

To use the library you have to create your own theme type as described in <doc:GettingStarted> guide.
For convenience you can also create color extensions as described in <doc:AccessingThemeColors> guide.
Finally you should inject selected theme in view environment as described in <doc:ChangingThemes> guide.

For tips on how to persist selected theme see <doc:StoringSelectedTheme> guide.

## Copy paste snippet

The following code snippet lists minimal code needed to configure the library. You can copy and paste it to your project filling in necessary details.

- <#default theme#> - instance of your theme that should be used by default
- <#color from theme#> - Color property from your theme that you'll want to easily access

```swift
import SwiftUI
import SwiftUITheme

struct Theme {
    let <#color from theme#>: Color
}

extension Theme: BaseTheme {
    static let defaultValue: Theme = <#default theme#>
    static let environmentValue: WritableKeyPath<EnvironmentValues, Theme> = \.theme
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

## Topics

### Essentials

- <doc:GettingStarted>
- <doc:AccessingThemeColors>
- <doc:ChangingThemes>
- ``BaseTheme``
- ``ThemeColor``

### Extras

- <doc:StoringSelectedTheme>
