#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"
source "common.sh"

pushd "${BUILD_DIR}/workers/game-worker"
    rm -rf improbable
    rm -rf bin
popd

pushd "${BUILD_DIR}/workers/tps-client"
    rm -rf "Code/Generated"
popd

rm -rf "${DOWNLOAD_DIR}"
rm -rf schema/bin
