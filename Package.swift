// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "STTextView",
    
    platforms: [.iOS(.v10)],
    
    products: [ .library(name: "STTextView", targets: ["STTextView"]) ],
    targets: [ .target(name: "STTextView", path: "STTextView/STTextView") ],
    
    swiftLanguageVersions: [.v5]
)

