import SwiftUI

extension Shape {
    public func fill(_ themeColor: ThemeColor<some BaseTheme>) -> some View {
        ThemeColoredView(color: themeColor) { color in
            self.fill(color)
        }
    }

    public func stroke(_ themeColor: ThemeColor<some BaseTheme>, lineWidth: CGFloat = 1) -> some View {
        ThemeColoredView(color: themeColor) { color in
            self.stroke(color, lineWidth: lineWidth)
        }
    }
}
