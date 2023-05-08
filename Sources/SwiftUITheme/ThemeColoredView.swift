import SwiftUI

struct ThemeColoredView<Theme: BaseTheme, Body: View>: View {
    let color: ThemeColor<Theme>
    @ViewBuilder let content: (Color) -> Body

    @Environment(Theme.environmentValue) private var theme

    var body: Body {
        content(color.resolve(for: theme))
    }
}
