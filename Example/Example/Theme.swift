//
//  MyTheme.swift
//  SwiftUIThemeExample
//
//  Created by Łukasz Rutkowski on 08/05/2023.
//

import SwiftUI

// Custom theme, this can hold anything you want
struct Theme {
    let color: Color
}

extension Theme {
    static let red = Theme(color: .red)
    static let blue = Theme(color: .blue)
}

// 1. Import the library
import SwiftUITheme

// 2. Conform custom theme type to BaseTheme by providing:
//   - default value to use if no theme is in environment
//   - key-path instructing how to read theme from environment
extension Theme: BaseTheme {
    static var defaultValue: Theme = Theme.red
    static var environmentValue: WritableKeyPath<EnvironmentValues, Theme> { \.theme }
}

// 3. Extend environment values with a way to access theme
extension EnvironmentValues {
    var theme: Theme {
        get { self[Theme.self] }
        set { self[Theme.self] = newValue }
    }
}

// 4. Optionally define extensions on colors from theme to make them easier to read in views
extension ThemeColor where Self == ThemeColor<Example.Theme> {
    static var themedColor: Self { Self(\.color) }
}
