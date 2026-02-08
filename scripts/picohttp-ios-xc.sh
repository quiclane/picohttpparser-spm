set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.."&&pwd)"
UP="$ROOT/upstream"
BUILD="$ROOT/ios-build"
HDR="$ROOT/overlay-headers"
OUT="$ROOT/artifacts"
XC="$ROOT/PicoHTTPParser.xcframework"
SDK_IOS=iphoneos
SDK_SIM=iphonesimulator
DEPLOY=12.0
rm -rf "$BUILD" "$OUT" "$XC"
mkdir -p "$BUILD" "$OUT"
test -f "$HDR/picohttpparser.h"
test -f "$HDR/module.modulemap"
CC="$(xcrun -f clang)"
CFLAGS_COMMON="-O3 -fvisibility=hidden -fPIC -Wall -Wextra -Werror -Wno-unused-parameter"
build_arch() {
D="$1"
SDK="$2"
ARCH="$3"
SYSROOT="$(xcrun -sdk "$SDK" --show-sdk-path)"
MINFLAG="-mios-version-min=$DEPLOY"
test "$SDK" = "$SDK_SIM" && MINFLAG="-mios-simulator-version-min=$DEPLOY"
mkdir -p "$D"
"$CC" $CFLAGS_COMMON -isysroot "$SYSROOT" -arch "$ARCH" $MINFLAG -c "$UP/picohttpparser.c" -o "$D/picohttpparser.o"
libtool -static -o "$D/libpicohttpparser.a" "$D/picohttpparser.o"
}
build_arch "$BUILD/ios-arm64" "$SDK_IOS" arm64
mkdir -p "$OUT/ios-arm64"
cp "$BUILD/ios-arm64/libpicohttpparser.a" "$OUT/ios-arm64/libpicohttpparser.a"
build_arch "$BUILD/sim-arm64" "$SDK_SIM" arm64
build_arch "$BUILD/sim-x86_64" "$SDK_SIM" x86_64
mkdir -p "$OUT/ios-simulator"
lipo -create "$BUILD/sim-arm64/libpicohttpparser.a" "$BUILD/sim-x86_64/libpicohttpparser.a" -output "$OUT/ios-simulator/libpicohttpparser.a"
xcodebuild -create-xcframework -library "$OUT/ios-arm64/libpicohttpparser.a" -headers "$HDR" -library "$OUT/ios-simulator/libpicohttpparser.a" -headers "$HDR" -output "$XC"
