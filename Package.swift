// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppKit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppKit",
            targets: ["AppKit"]),
        .library(
            name: "CoreGraphics",
            targets: ["CoreGraphics"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoreGraphics",
            dependencies: [  ]
        ),
        .target(
            name: "AppKit",
            dependencies: [ "CoreGraphics" ]
        ),
        .testTarget(
            name: "AppKitTests",
            dependencies: ["AppKit"]
        ),
    ]
)
