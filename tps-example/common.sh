#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"

DOWNLOAD_DIR="$(pwd)/build/download"
BUILD_DIR="$(pwd)"
SDK_VERSION="12.1.0"
GAME_WORKER_DIR="game-worker"
TPS_CLIENT_DIR="tps-client"

function isLinux() {
  [[ "$(uname -s)" == "Linux" ]]
}

function isMacOS() {
  [[ "$(uname -s)" == "Darwin" ]]
}

function isWindows() {
  ! (isLinux || isMacOS)
}

# Return the target platform used by worker package names built for this OS.
function getPlatformName() {
  if isLinux; then
    echo "linux"
  elif isMacOS; then
    echo "macos"
  elif isWindows; then
    echo "win32"
  else
    echo "ERROR: Unknown platform." >&2
    exit 1
  fi
}

PLATFORM_NAME=$(getPlatformName)
