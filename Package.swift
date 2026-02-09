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
      checksum:"25c162187ec31332807f058ef25d8f328e7e2ccc82653469aa169f901a2b67c8"
    ),
    .target(
      name:"PicoHTTPParserShim",
      dependencies:["PicoHTTPParser"],
      path:"Sources/PicoHTTPParserShim"
    )
  ]
)
