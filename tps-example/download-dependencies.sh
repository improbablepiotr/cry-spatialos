#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"
source "common.sh"

retrievePackage() {
  TYPE=$1
  PACKAGE=$2

  pushd "${DOWNLOAD_DIR}"
  if [ ! -f "${PACKAGE}.zip" ]; then
    spatial package retrieve --force "${TYPE}" "${PACKAGE}" "${SDK_VERSION}" "${PACKAGE}.zip"
    unzip -o "${PACKAGE}.zip"
  fi
  popd
}

mkdir -p "${DOWNLOAD_DIR}"

# Get the tools:
# * Spatial Schema compiler
# * Standard Library Schemas
# * Core SDK for all platforms to enable building workers for MacOS, Windows or Linux
# * C# SDK
retrievePackage "tools" "schema_compiler-x86_64-${PLATFORM_NAME}"
retrievePackage "schema" "standard_library"
retrievePackage "worker_sdk" "csharp"
retrievePackage "worker_sdk" "core-dynamic-x86_64-win32"
retrievePackage "worker_sdk" "core-dynamic-x86_64-linux"
retrievePackage "worker_sdk" "core-dynamic-x86_64-macos"

echo "Dependencies download complete"
