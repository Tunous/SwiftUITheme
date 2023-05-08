# Accessing theme colors

Define and access colors from your themes.

## Overview

Getting started guide described how to configure a theme type to work with the theming system.
Once that's done it's now possible to access theme from environment like below.

```swift
struct ContentView: View {
    @Environment(\.theme) private var theme

    var body: some View {
        Text("Hello").foregroundColor(theme.color)
        Text("World").foregroundColor(\Theme.color)
    }
}
```

Notice how in the above example we either had to access color from the theme property or provide a keyPath to color by passing in full type.
To make accessing themed colors more convenient than that we can extend ``ThemeColor`` type with information about how to access custom colors.

```swift
extension ThemeColor where Self == ThemeColor<Theme> {
    static var color: Self { Self(\.color) }
}
```

This allows us to use extensions like `View.foregroundColor`, `Shape.fill`, etc. with colors that change based on theme. Now the previous example could look like this:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello").foregroundColor(.color)
    }
}
```
