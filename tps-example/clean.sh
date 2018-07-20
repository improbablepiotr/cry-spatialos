#!/usr/bin/env bash

set -e -x

cd "$(dirname "$0")"

WORKER_DIRS=(workers/game-worker)
BUILD_DIR="$(pwd)"
DOWNLOAD_DIR="$(pwd)/build/download"

for WORKER in "${WORKER_DIRS[@]}"; do
  pushd "${BUILD_DIR}/${WORKER}"
  rm -rf improbable
  rm -rf bin
  popd
done

rm -rf "${DOWNLOAD_DIR}"
rm -rf schema/bin
