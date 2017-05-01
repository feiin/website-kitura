// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "SwiftmiKituraWeb",
    targets: [
        Target(name: "App")

    ],
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1),
        .Package(url: "https://github.com/IBM-Swift/Configuration.git", majorVersion:1),
        .Package(url: "https://github.com/vapor/mysql-driver.git",majorVersion:1),
        .Package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git",majorVersion:1)
    ]
)
