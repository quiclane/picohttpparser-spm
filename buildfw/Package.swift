import PackageDescription
let package=Package(name:"buildfw",products:[.library(name:"PicoHTTPParser",type:.dynamic,targets:["PicoHTTPParser"])],targets:[.target(name:"PicoHTTPParser",path:"Sources/PicoHTTPParser",publicHeadersPath:"include",cSettings:[.headerSearchPath("include")])])
