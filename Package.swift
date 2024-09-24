// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppKit",
    products: [
        .library(
            name: "AppKit",
            targets: ["AppKit"]),
        .library(
            name: "CoreGraphics",
            targets: ["CoreGraphics"]),
        .executable(
            name: "Sample",
            targets: ["Sample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/helbertgs/OpenGLFW.git", branch: "main")
    ],
    targets: [
        .target(
            name: "CoreGraphics",
            dependencies: [  ]
        ),
        .target(
            name: "AppKit",
            dependencies: [ 
                "CoreGraphics",
                .product(name: "OpenGLFW", package: "OpenGLFW")
            ]
        ),
        .executableTarget(
            name: "Sample",
            dependencies: [ "AppKit" ]
        ),
        .testTarget(
            name: "AppKitTests",
            dependencies: ["AppKit"]
        ),
    ]
)
