# Storing selected theme

How to persist selected theme.

## Overview

This library in its own doesn't provide a way to store selected themes.
Instead if your app already uses some solution to store user preferences you can use it to store key identifying selected theme.
Based on that you can create correct instance of your theme and set it somewhere high in view hierarchy using `View.theme(_:)` modifier.

### AppStorage example

Here is an example of how to persist selected theme using SwiftUI's AppStorage property wrapper.
We'll continue on sample theme structure from previous guides.

First lets define a type that will be persisted and hold id of selected theme.
Using enum is a good solution for that.

```swift
enum ThemeId: String {
    case blue
    case red
}
```

Then lets add a property that will map this type to proper theme.

```swift
extension ThemeId {
    var theme: Theme {
        switch self {
            case .blue: return .blue
            case .red: return .red
        }
    }
}
```

Finally lets use it with `AppStorage`.

```swift
struct ContentView: View {
    @AppStorage("theme") private var themeId = ThemeId.blue

    var body: some View {
        VStack {
            // ...
        }
        .theme(themeId.theme)
    }
}
```

Changing theme is then as simple as modifying this `themeId` property with different value.
View hierarchy will automatically react to changes and use new theme.
