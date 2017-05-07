// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "SwiftBinData",
    targets: [
        Target(name: "SwiftBinData"),
        Target(name: "Run", dependencies: ["SwiftBinData"])
    ],
    dependencies: [
        .Package(url: "https://github.com/oarrabi/Guaka.git", majorVersion: 0)
    ],
    exclude:[
        "assets",
        "dest"
    ]
)
