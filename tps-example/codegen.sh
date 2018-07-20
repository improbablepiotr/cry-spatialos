#!/usr/bin/env bash
set -e -x
cd "$(dirname "$0")"
source "common.sh"

pushd "${BUILD_DIR}/workers/game-worker"
    # Compile the schema
    OUT_DIR=improbable/generated
    mkdir -p "$OUT_DIR"
    "$DOWNLOAD_DIR"/schema_compiler --schema_path="${BUILD_DIR}/schema" --schema_path="$DOWNLOAD_DIR" --csharp_out="$OUT_DIR" --load_all_schema_on_schema_path "${BUILD_DIR}"/schema/automaton/*.schema "${BUILD_DIR}"/schema/automaton/player/*.schema "${DOWNLOAD_DIR}"/improbable/*.schema
popd

pushd "${BUILD_DIR}/workers/tps-client"
    # Compile the schema
    OUT_DIR=Code/Generated/std
    mkdir -p "$OUT_DIR"
    "$DOWNLOAD_DIR"/schema_compiler --schema_path="${BUILD_DIR}/schema" --schema_path="$DOWNLOAD_DIR" --cpp_out="$OUT_DIR" --load_all_schema_on_schema_path "${DOWNLOAD_DIR}"/improbable/*.schema
    OUT_DIR=Code/Generated/usr
    mkdir -p "$OUT_DIR"
    "$DOWNLOAD_DIR"/schema_compiler --schema_path="${BUILD_DIR}/schema" --schema_path="$DOWNLOAD_DIR" --cpp_out="$OUT_DIR" --load_all_schema_on_schema_path "${BUILD_DIR}"/schema/automaton/*.schema "${BUILD_DIR}"/schema/automaton/player/*.schema
    OUT_DIR=Code/Generated/json
    mkdir -p "$OUT_DIR"
    "$DOWNLOAD_DIR"/schema_compiler --schema_path="${BUILD_DIR}/schema" --schema_path="$DOWNLOAD_DIR" --ast_json_out="$OUT_DIR" --load_all_schema_on_schema_path "${BUILD_DIR}"/schema/automaton/*.schema "${BUILD_DIR}"/schema/automaton/player/*.schema "${DOWNLOAD_DIR}"/improbable/*.schema
popd

# Compile the schemas into a schema descriptor: compile schemas to proto, compile proto
# This step will be simplified into a single command in the future
mkdir -p "${DOWNLOAD_DIR}/generated_protos"
cp -r "${DOWNLOAD_DIR}"/proto/* "${DOWNLOAD_DIR}/generated_protos"
mkdir -p "${BUILD_DIR}/schema/bin"

"${DOWNLOAD_DIR}/schema_compiler" --schema_path="${BUILD_DIR}/schema" --schema_path="$DOWNLOAD_DIR" --proto_out="${DOWNLOAD_DIR}/generated_protos" --load_all_schema_on_schema_path "${BUILD_DIR}"/schema/automaton/*.schema "${BUILD_DIR}"/schema/automaton/player/*.schema "${DOWNLOAD_DIR}"/improbable/*.schema

"${DOWNLOAD_DIR}/protoc" --proto_path="${DOWNLOAD_DIR}/generated_protos" --descriptor_set_out="${BUILD_DIR}/schema/bin/schema.descriptor" --include_imports "${DOWNLOAD_DIR}"/generated_protos/**/*.proto "${DOWNLOAD_DIR}"/generated_protos/automaton/**/*.proto

rm -r "${DOWNLOAD_DIR}/generated_protos"

echo "Code generation complete"