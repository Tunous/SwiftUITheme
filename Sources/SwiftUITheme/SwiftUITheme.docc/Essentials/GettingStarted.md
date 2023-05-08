# Getting started

Define base theme type for your app.

## Overview

The core component of theming system is a theme type defining properties that can change between themes.
Lets say that in our app we want to define a single color that will change depending on a theme.
We can create a struct which will hold that color. We'll name it `Theme` and define few themes as follows:

```swift
import SwiftUI

struct Theme {
    let color: Color
}

extension Theme {
    static let red = Theme(color: .red)
    static let blue = Theme(color: .blue)
}
```

Now to make this type work with the theming system we have to conform it to `BaseTheme` protocol. This protocol has two requirements:
1. `defaultValue` static property where we define what to use as default theme.
2. `environmentValue` property where we have to return key path to read and write theme from SwiftUI environment.

Making our example theme conform to this protocol would look like this:

```swift
import SwiftUI
import SwiftUITheme

extension Theme: BaseTheme {
    static let defaultValue: Theme = Theme.red
    static let environmentValue: WritableKeyPath<EnvironmentValues, Theme> = \.theme
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[Theme.self] }
        set { self[Theme.self] = newValue }
    }
}
```

With that done we can now access that theme from environment in our views.

```swift
struct ContentView: View {
    @Environment(\.theme) private var theme

    var body: some View {
        Text("Hello").foregroundColor(theme.color)
    }
}
```
