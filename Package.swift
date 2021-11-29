// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "EmptyDataSet-Swift",
    platforms: [
        .iOS(.v8),
    ],
    products: [
        .library(
            name: "EmptyDataSet",
            targets: ["EmptyDataSet"]),
    ],
    targets: [
        .target(
            name: "EmptyDataSet",
            dependencies: [],
            path: "EmptyDataSet-Swift/Sources"),
    ]
)
