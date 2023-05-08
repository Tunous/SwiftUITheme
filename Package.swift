// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "SwiftUITheme",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "SwiftUITheme", targets: ["SwiftUITheme"]),
    ],
    targets: [
        .target(name: "SwiftUITheme", dependencies: []),
    ]
)
