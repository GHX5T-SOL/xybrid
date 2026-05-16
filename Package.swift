// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Xybrid",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Xybrid",
            targets: ["Xybrid"]
        )
    ],
    targets: [
        .target(
            name: "Xybrid",
            dependencies: ["XybridFFI"],
            path: "Sources/Xybrid",
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedFramework("Metal"),
                .linkedFramework("MetalPerformanceShaders"),
                .linkedFramework("MetalPerformanceShadersGraph"),
                .linkedFramework("CoreML"),
                .linkedFramework("Accelerate"),
                .linkedFramework("Security"),
            ]
        ),
        .binaryTarget(
            name: "XybridFFI",
            url: "https://github.com/xybrid-ai/xybrid/releases/download/v0.1.0-rc3/XybridFFI-v0.1.0-rc3.xcframework.zip",
            checksum: "03bd2024645ee99681d266717431f2ea9c297fcae0de414e52cbdc83be463285"
        )
    ]
)
