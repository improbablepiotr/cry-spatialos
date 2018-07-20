#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"
source "common.sh"

WORKER_DIRS=(workers/game-worker)
BUILD_PLATFORMS=(Windows64 Linux64)

# For each worker:
for WORKER in "${WORKER_DIRS[@]}"; do
  pushd "${BUILD_DIR}/${WORKER}"
  # Compile UserCode+SDK+C#Schema into a binary
  mkdir -p improbable/dependencies/managed
  mkdir -p improbable/dependencies/native
  cp "$DOWNLOAD_DIR"/Improbable.WorkerSdkCsharp.dll improbable/dependencies/managed
  cp "$DOWNLOAD_DIR"/*.dylib improbable/dependencies/native
  cp "$DOWNLOAD_DIR"/*.dll improbable/dependencies/native
  cp "$DOWNLOAD_DIR"/*.so improbable/dependencies/native
  for PLATFORM in "${BUILD_PLATFORMS[@]}"; do
    xbuild CsharpWorker.sln /property:Configuration=Release /property:Platform="$PLATFORM" /property:AllowUnsafeBlocks=true
  done
  popd
done

echo "Build game worker complete"
