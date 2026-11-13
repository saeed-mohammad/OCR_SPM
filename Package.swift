// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AccuraOCR",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Device-only (arm64) binary framework. Simulator is not supported.
        .library(name: "AccuraOCR", targets: ["AccuraOCRSPM"])
    ],
    dependencies: [
        .package(url: "https://github.com/saeed-mohammad/Tensorflow", exact: "1.0.6"),
        .package(url: "https://github.com/SVProgressHUD/SVProgressHUD", from: "2.3.1"),
        .package(url: "https://github.com/google/GoogleDataTransport", from: "10.1.0"),
        .package(url: "https://github.com/google/GoogleUtilities", from: "8.1.0"),
        .package(url: "https://github.com/google/promises", from: "2.4.0"),
        .package(url: "https://github.com/firebase/nanopb", from: "2.30910.0"),
        .package(url: "https://github.com/google/gtm-session-fetcher", from: "5.3.0"),
        .package(url: "https://github.com/google/google-toolbox-for-mac", from: "6.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "AccuraOCR",
            url: "https://github.com/saeed-mohammad/OCR_SPM/releases/download/0.0.1/AccuraOCR.xcframework.zip",
            checksum: "39afb672db9766f8f45bfe4fe4b65dc9bc5babaa984d5abcad35105f8ad81418"
        ),
        .target(
            name: "AccuraOCRSPM",
            dependencies: [
                "AccuraOCR",
                .product(name: "TensorFlowLiteTaskVision", package: "Tensorflow"),
                .product(name: "SVProgressHUD", package: "SVProgressHUD"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "GoogleUtilities-Environment", package: "GoogleUtilities"),
                .product(name: "FBLPromises", package: "promises"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleToolboxForMac", package: "google-toolbox-for-mac")
            ],
            path: "Sources/AccuraOCRSPM"
        )
    ]
)
