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
      checksum:"8e3a356d2c14974e066828f2e51ba8b57f7c385ac720ca1d0121d6b42b354b3d"
    ),
    .target(
      name:"PicoHTTPParserShim",
      dependencies:["PicoHTTPParser"],
      path:"Sources/PicoHTTPParserShim"
    )
  ]
)
