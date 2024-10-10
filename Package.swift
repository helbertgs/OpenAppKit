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
            name: "CoreAnimation",
            targets: ["CoreAnimation"]),
        .library(
            name: "CoreGraphics",
            targets: ["CoreGraphics"]),
        .library(
            name: "CoreImage",
            targets: ["CoreImage"]),
        .executable(
            name: "AppKitSample",
            targets: ["AppKitSample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/helbertgs/OpenGLFW.git", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenGLAD.git", branch: "main")
    ],
    targets: [
        .target(
            name: "CoreImage",
            dependencies: [  ]
        ),
        .target(
            name: "CoreGraphics",
            dependencies: [ "CoreImage" ]
        ),
        .target(
            name: "CoreAnimation",
            dependencies: [ "CoreGraphics" ]
        ),
        .target(
            name: "AppKit",
            dependencies: [ 
                "CoreAnimation",
                "CoreGraphics",
                "CoreImage",
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
