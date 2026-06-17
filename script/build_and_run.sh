#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-run}"
APP_NAME="Pearcleaner"
BUNDLE_ID="com.alienator88.Pearcleaner"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DERIVED_DATA="$ROOT_DIR/.derivedData"
APP_BUNDLE="$DERIVED_DATA/Build/Products/Debug/$APP_NAME.app"
APP_BINARY="$APP_BUNDLE/Contents/MacOS/$APP_NAME"

build_app() {
  xcodebuild \
    -project "$ROOT_DIR/Pearcleaner.xcodeproj" \
    -scheme "Pearcleaner Debug" \
    -configuration Debug \
    -derivedDataPath "$DERIVED_DATA" \
    CODE_SIGNING_ALLOWED=NO \
    CODE_SIGNING_REQUIRED=NO \
    build

  if [[ ! -x "$APP_BINARY" ]]; then
    echo "Build completed but the app executable was not found at $APP_BINARY" >&2
    exit 1
  fi
}

open_app() {
  /usr/bin/open -n "$APP_BUNDLE"
}

pkill -x "$APP_NAME" >/dev/null 2>&1 || true
build_app

case "$MODE" in
  run)
    open_app
    ;;
  --debug|debug)
    lldb -- "$APP_BINARY"
    ;;
  --logs|logs)
    open_app
    /usr/bin/log stream --info --style compact --predicate "process == \"$APP_NAME\""
    ;;
  --telemetry|telemetry)
    open_app
    /usr/bin/log stream --info --style compact --predicate "subsystem == \"$BUNDLE_ID\""
    ;;
  --verify|verify)
    open_app
    sleep 2
    pgrep -x "$APP_NAME" >/dev/null
    echo "$APP_NAME launched successfully."
    ;;
  *)
    echo "usage: $0 [run|--debug|--logs|--telemetry|--verify]" >&2
    exit 2
    ;;
esac
