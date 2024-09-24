// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppKits",
    products: [
        .library(
            name: "AppKits",
            targets: ["AppKits"]),
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
            name: "AppKits",
            dependencies: [ 
                "CoreGraphics",
                .product(name: "OpenGLFW", package: "OpenGLFW")
            ]
        ),
        .executableTarget(
            name: "Sample",
            dependencies: [ "AppKits" ]
        ),
        .testTarget(
            name: "AppKitTests",
            dependencies: ["AppKits"]
        ),
    ]
)
