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
      checksum:"f9859b79cbfde749a26240b93b7f23a2c0e080d9988795591194fbc8c4bd4c9b"
    ),
    .target(
      name:"PicoHTTPParserShim",
      dependencies:["PicoHTTPParser"],
      path:"Sources/PicoHTTPParserShim"
    )
  ]
)
