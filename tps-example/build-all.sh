#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"

./download-dependencies.sh
./codegen.sh

echo "Build all complete"
