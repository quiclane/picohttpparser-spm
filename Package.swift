// swift-tools-version:5.9
import PackageDescription
let package=Package(name:"picohttpparser-spm",platforms:[.iOS(.v12),.tvOS(.v12),.watchOS(.v5)],products:[.library(name:"PicoHTTPParser",targets:["PicoHTTPParser","PicoHTTPParserShim"]),.library(name:"PicoHTTPParserShim",targets:["PicoHTTPParserShim"])],targets:[.binaryTarget(name:"PicoHTTPParser",path:"PicoHTTPParser.xcframework"),.target(name:"PicoHTTPParserShim",dependencies:["PicoHTTPParser"],path:"Sources/PicoHTTPParserShim")])
