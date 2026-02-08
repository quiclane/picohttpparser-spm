// swift-tools-version:5.9
import PackageDescription
let package=Package(
  name:"picohttpparser-spm",
  platforms:[.iOS(.v12),.tvOS(.v12),.watchOS(.v5),.macOS(.v10_15)],
  products:[
    .library(name:"PicoHTTPParser",targets:["PicoHTTPParser"])
  ],
  targets:[
    .target(
      name:"PicoHTTPParser",
      path:"Sources/PicoHTTPParser",
      publicHeadersPath:"include"
    )
  ]
)
