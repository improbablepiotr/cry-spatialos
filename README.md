# CrySpatialOS ("crysos")

SpatialOS 12 integration for CRYENGINE 5.4

## Directory Structure

### sdk
`sdk` contains the C++ files to be included in your CRYENGINE project to integrate with SpatialOS.

### tools
`tools` contains the project `ComponentGenerator`, which is used to generate CRYENGINE Entity Components to mirror your SpatialOS components for use within CRYENGINE from C++ and/or Schematyc.

### tps-example
This is a simple third-person shooter game template produced using the integration.

## Building The Example Project

1. Ensure CryENGINE 5.4 or later and `spatial` are installed
2. Run `build-all.sh` from the `tps-example` directory. This will:
    1. Download dependencies (download-dependencies.sh).
    2. Generate code from schema (codegen.sh).
    3. Build the GameWorker (build-game-worker.sh).
3. Generate the solution for `tps-client` by right-clicking `Game.cryproject`
4. Build the solution in Visual Studio to provide the `tps-client` worker. (See below section for more information)
5. Run `spatial local launch` from the `tps-example` directory
6. Run any number of clients by right-clicking `Game.cryproject` and selecting `Run Game` (or the exe generated from the `Package Build` option)

### Building tps-client
`tps-client` should only be built in the Profile or Release build configuration - linking in the Debug configuration currently fails.
