#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"
source "common.sh"

pushd "${GAME_WORKER_DIR}"
    rm -rf improbable
    rm -rf bin
popd

pushd "${TPS_CLIENT_DIR}"
    rm -rf "Code/Generated"
    rm -rf "Code/ThirdParty"
popd

rm -rf "${DOWNLOAD_DIR}"
rm -rf schema/bin

echo "Clean completed"
