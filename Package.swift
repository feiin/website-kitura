// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "SwiftmiKituraWeb",
    targets: [
        Target(name: "App",
               dependencies: [.Target(name: "Middlewares"),.Target(name: "Models"),.Target(name: "Repositories"),.Target(name: "Controllers")]),
        Target(name: "Middlewares"),
        Target(name: "Models"),
        Target(name: "Repositories"),
        Target(name: "Controllers",dependencies:[.Target(name: "Models")])

    ],
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1),
        .Package(url: "https://github.com/IBM-Swift/Configuration.git", majorVersion:1),
        .Package(url: "https://github.com/vapor/mysql-driver.git",majorVersion:1)

    ]
)
