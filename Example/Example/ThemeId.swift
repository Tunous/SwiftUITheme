//
//  ThemeId.swift
//  Example
//
//  Created by Łukasz Rutkowski on 06/06/2023.
//

import Foundation

enum ThemeId: String, CaseIterable, Identifiable {
    case red
    case blue

    var id: Self { self }

    var theme: Theme {
        switch self {
        case .red: return .red
        case .blue: return .blue
        }
    }
}
