// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DetailsFeatures",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DetailsFeatures",
            targets: ["DetailsFeatures"]),
    ],
    dependencies: [
        .package(path: "../BaseLayer/CoreLayer"),
        .package(path: "../BaseLayer/NetworkLayer"),
        .package(path: "../BaseLayer/UILayer"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DetailsFeatures",
        dependencies: ["CoreLayer", "NetworkLayer", "UILayer"]),
        .testTarget(
            name: "DetailsFeaturesTests",
            dependencies: ["DetailsFeatures"]),
    ]
)
