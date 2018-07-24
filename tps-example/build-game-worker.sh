#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"
source "common.sh"

BUILD_PLATFORMS=(Windows64 Linux64)

pushd "${GAME_WORKER_DIR}"
# Compile UserCode+SDK+C#Schema into a binary
mkdir -p improbable/dependencies/managed
mkdir -p improbable/dependencies/native
cp "$DOWNLOAD_DIR"/Improbable.WorkerSdkCsharp.dll improbable/dependencies/managed
cp "$DOWNLOAD_DIR"/*.dll improbable/dependencies/native
cp "$DOWNLOAD_DIR"/*.so improbable/dependencies/native
for PLATFORM in "${BUILD_PLATFORMS[@]}"; do
xbuild CsharpWorker.sln /property:Configuration=Release /property:Platform="$PLATFORM" /property:AllowUnsafeBlocks=true
done
popd

echo "Build game worker complete"
