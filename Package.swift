// swift-tools-version:5.9
import PackageDescription
let package=Package(
  name:"picohttpparser-spm",
  platforms:[.iOS(.v12),.tvOS(.v12),.watchOS(.v5)],
  products:[
    .library(name:"PicoHTTPParser",targets:["PicoHTTPParser","PicoHTTPParserShim"]),
    .library(name:"PicoHTTPParserShim",targets:["PicoHTTPParserShim"])
  ],
  targets:[
    .binaryTarget(
      name:"PicoHTTPParser",
      url:"https://github.com/quiclane/picohttpparser-spm/releases/download/1.0.0/PicoHTTPParser.xcframework.zip",
      checksum:"392d5016bc1c6454f7ffa49260bf16f9d50ab8a6e128f63ad0bbf6035519ff9b"
    ),
    .target(
      name:"PicoHTTPParserShim",
      dependencies:["PicoHTTPParser"],
      path:"Sources/PicoHTTPParserShim"
    )
  ]
)
