#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"

./download-dependencies.sh
./codegen.sh
./build-game-worker.sh

echo "Build all complete"
