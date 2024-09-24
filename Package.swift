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
            name: "AppKitSample",
            targets: ["AppKitSample"]),
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
            name: "AppKitSample",
            dependencies: [ "AppKit" ]
        ),
        .testTarget(
            name: "AppKitTests",
            dependencies: ["AppKit"]
        ),
    ]
)
