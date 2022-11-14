// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift-environment",
    products: [
        .library(name: "SwiftEnvironment", targets: ["SwiftEnvironment"])
    ],
    dependencies: [],
    targets: [
        .target(name: "SwiftEnvironment", dependencies: []),
        .testTarget(name: "SwiftEnvironmentTests", dependencies: ["SwiftEnvironment"])
    ]
)
