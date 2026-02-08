import PackageDescription
let package=Package(
name:"picohttpparser-spm",
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
