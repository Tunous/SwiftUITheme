import SwiftUI

extension View {
    /// Overrides a `theme` used by child views.
    public func theme<Theme: BaseTheme>(_ theme: Theme) -> some View {
        self.environment(Theme.environmentValue, theme)
    }

    public func foregroundColor(_ themeColor: ThemeColor<some BaseTheme>) -> some View {
        ThemeColoredView(color: themeColor) { color in
            self.foregroundColor(color)
        }
    }

    public func foregroundColor(_ themeColorKeyPath: KeyPath<some BaseTheme, Color>) -> some View {
        self.foregroundColor(ThemeColor(themeColorKeyPath))
    }

    public func tint(_ themeColor: ThemeColor<some BaseTheme>) -> some View {
        ThemeColoredView(color: themeColor) { color in
            self.tint(color)
        }
    }

    public func accentColor(_ themeColor: ThemeColor<some BaseTheme>) -> some View {
        ThemeColoredView(color: themeColor) { color in
            self.accentColor(color)
        }
    }
}
