// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenAppKit",
    products: [
        .library(
            name: "OpenAppKit",
            targets: ["OpenAppKit"]),
        .library(
            name: "OpenCoreAnimation",
            targets: ["OpenCoreAnimation"]),
        .library(
            name: "OpenCoreGraphics",
            targets: ["OpenCoreGraphics"]),
        .library(
            name: "OpenCoreImage",
            targets: ["OpenCoreImage"]),
        .executable(
            name: "OpenAppKitSample",
            targets: ["OpenAppKitSample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/helbertgs/OpenGLFW.git", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenGLAD.git", branch: "main"),
        .package(url: "https://github.com/helbertgs/OpenSTB.git", branch: "main"),
        .package(url: "https://github.com/apple/swift-log.git", branch: "main")
    ],
    targets: [
        .target(
            name: "OpenCoreGraphics",
            dependencies: [ 
                .product(name: "OpenGLAD", package: "OpenGLAD"),
                .product(name: "OpenGLFW", package: "OpenGLFW"),
                .product(name: "OpenSTB", package: "OpenSTB")
            ]
        ),
        .target(
            name: "OpenCoreImage",
            dependencies: [
                "OpenCoreGraphics",
                .product(name: "OpenGLAD", package: "OpenGLAD"),
                .product(name: "OpenSTB", package: "OpenSTB")
             ]
        ),
        .target(
            name: "OpenCoreAnimation",
            dependencies: [ 
                "OpenCoreGraphics",
                .product(name: "OpenGLAD", package: "OpenGLAD")
            ]
        ),
        .target(
            name: "OpenAppKit",
            dependencies: [ 
                "OpenCoreAnimation",
                "OpenCoreGraphics",
                "OpenCoreImage",
                .product(name: "OpenGLFW", package: "OpenGLFW"),
                .product(name: "Logging", package: "swift-log")
            ]
        ),
        .executableTarget(
            name: "OpenAppKitSample",
            dependencies: [ "OpenAppKit" ]
        ),
        .testTarget(
            name: "OpenAppKitTests",
            dependencies: ["OpenAppKit"]
        ),
    ]
)
