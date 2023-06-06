//
//  ContentView.swift
//  Example
//
//  Created by Łukasz Rutkowski on 06/06/2023.
//

import SwiftUI
import SwiftUITheme

struct ContentView: View {
    // Example how to store user selected theme, this is not part of library and
    // you can do this in any way you want
    @AppStorage("theme") private var themeId: ThemeId = .red

    var body: some View {
        VStack {
            Picker("Theme", selection: $themeId) {
                ForEach(ThemeId.allCases) { themeId in
                    Text(themeId.rawValue.capitalized)
                }
            }
            .accentColor(.themedColor)

            // Access themed colors using previously defined extension
            Text("Colored text").foregroundColor(.themedColor)

            // Access themed colors using key path on theme
            Text("Colored text 2").foregroundColor(\Theme.color)

            // Works with shapes too
            Rectangle().fill(.themedColor)
            Circle().stroke(.themedColor, lineWidth: 5)
        }
        // Set theme on environment for this view hierarchy
        .theme(themeId.theme)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
