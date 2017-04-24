// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "SwiftmiKituraWeb",
    targets: [
        Target(name: "App",
               dependencies: [.Target(name: "Middlewares")]),
        Target(name: "Middlewares")
    ],
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1)

    ]
)
