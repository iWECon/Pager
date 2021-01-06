// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pager",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "Pager", targets: ["Pager"]),
    ],
    dependencies: [
        .package(name: "YTPageController", url: "https://github.com/iWECon/YTPageController", from: "1.0.0"),
    ],
    targets: [
        .target(name: "Pager", dependencies: ["YTPageController"]),
        .testTarget(name: "PagerTests", dependencies: ["Pager"]),
    ]
)
