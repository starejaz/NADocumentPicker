import PackageDescription

let package = Package(
    name: "BrightFutures",
    dependencies: [
        .Package(url: "https://github.com/Thomvis/BrightFutures.git", majorVersion: 8)
    ]
)
