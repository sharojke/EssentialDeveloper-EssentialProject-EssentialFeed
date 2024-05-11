// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "EssentialDeveloper-EssentialProject-EssentialFeed", // Matches the name of the repository! Preferably avoid long names and special chars (like "-"). However it works
    defaultLocalization: "en",
    platforms: [
        .macOS(.v12),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "EssentialFeed", // Preferably avoid long names and special chars (like "-")
            targets: ["EssentialFeed"]
        ),
    ],
    targets: [
        .target(
            name: "EssentialFeed"
        ),
        .testTarget(
            name: "EssentialFeedTests",
            dependencies: ["EssentialFeed"]
        ),
        .testTarget(
            name: "EssentialFeedAPIEndToEndTests",
            dependencies: ["EssentialFeed"]
        ),
        .testTarget(
            name: "EssentialFeedCacheIntegrationTests",
            dependencies: ["EssentialFeed"]
        ),
    ]
)
