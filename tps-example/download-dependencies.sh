#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"
source "common.sh"

retrievePackage() {
  TYPE=$1
  PACKAGE=$2
  TARGET_DIR=$3

  mkdir -p "${TARGET_DIR}"
  pushd "${TARGET_DIR}"
  if [ ! -f "${PACKAGE}.zip" ]; then
    spatial package retrieve --force "${TYPE}" "${PACKAGE}" "${SDK_VERSION}" "${PACKAGE}.zip"
    unzip -o "${PACKAGE}.zip"
  fi
  popd
}

mkdir -p "${DOWNLOAD_DIR}"

# Get the shared dependencies
retrievePackage "tools" "schema_compiler-x86_64-${PLATFORM_NAME}" "${DOWNLOAD_DIR}"
retrievePackage "schema" "standard_library" "${DOWNLOAD_DIR}"

# Game worker dependencies
retrievePackage "worker_sdk" "csharp" "${DOWNLOAD_DIR}"
retrievePackage "worker_sdk" "core-dynamic-x86_64-win32" "${DOWNLOAD_DIR}"
retrievePackage "worker_sdk" "core-dynamic-x86_64-linux" "${DOWNLOAD_DIR}"

# TPS worker dependencies
retrievePackage "worker_sdk" "cpp-static-x86_64-msvc_mdd-win32" "${TPS_CLIENT_DIR}/Code/ThirdParty/Improbable/windows_x64_debug"
retrievePackage "worker_sdk" "cpp-static-x86_64-msvc_md-win32" "${TPS_CLIENT_DIR}/Code/ThirdParty/Improbable/windows_x64_release"
retrievePackage "worker_sdk" "cpp-static-x86_64-gcc_libstdcpp-linux" "${TPS_CLIENT_DIR}/Code/ThirdParty/Improbable/linux_x64"

echo "Dependencies download complete"
