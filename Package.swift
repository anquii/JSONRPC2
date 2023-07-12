// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "JSONRPC2",
    products: [
        .library(name: "JSONRPC2", targets: ["JSONRPC2"])
    ],
    targets: [
        .target(name: "JSONRPC2"),
        .testTarget(name: "JSONRPC2Tests", dependencies: ["JSONRPC2"])
    ]
)
