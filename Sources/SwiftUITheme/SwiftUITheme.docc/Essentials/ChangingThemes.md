# Changing themes

Use the library to change themes in view hierarchies.

## Overview

The library provides `View.theme(_:)` extension which allows changing theme for child views.
Usually you'll want to call this high in the hierarchy to style the whole app.

```swift
import SwiftUI
import SwiftUITheme

@main
struct TrippyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .theme(Theme.blue)
        }
    }
}
```

If you want to often call this extension (for example in previews) you might want to add a small convenience extensions so you won't have to type `MyTheme.` prefix each time.

```swift
extension BaseTheme where Self == Theme {
    static var red: Self { Theme.red }
    static var blue: Self { Theme.blue }
}
```

With that our example could now look like this:

```swift
import SwiftUI
import SwiftUITheme

@main
struct TrippyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .theme(.blue)
        }
    }
}
```
