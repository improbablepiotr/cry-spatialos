# CrySpatialOS with flexible project layout
This is a fork of the
[SpatialOS CRYENGINE integration](https://github.com/Automaton/cry-spatialos)
that uses the new
[SpatialOS flexible project layout](https://github.com/spatialos/FlexibleProjectExample).

## Directory Structure

### sdk
`sdk` contains the C++ files to be included in your CRYENGINE project to
integrate with SpatialOS.

### tools
`tools` contains the project `ComponentGenerator`, which is used to generate
CRYENGINE Entity Components to mirror your SpatialOS components for use
within CRYENGINE from C++ and/or Schematyc.

### tps-example
This is a simple third-person shooter game template produced using the integration.
There are two workers:
* `GameWorker` in the `tps-example/game-worker` directory.
* `TPSClient` in the `tps-example/tps-client` directory.

Unlike in previous version of the project layout, the workers no longer
need to be under `workers` directory - the location of each worker
directory is defined in the `spatialos.json` file instead. See the
[SpatialOS flexible project example](https://github.com/spatialos/FlexibleProjectExample)
for more details.

## Building The Example Project

1. Ensure CryENGINE 5.4 or later and `spatial` are installed
2. Run `build-all.sh` from the `tps-example` directory. This will:
    1. Download dependencies (download-dependencies.sh).
    2. Generate code from schema (codegen.sh).
3. Generate the solution for `tps-client` by right-clicking `Game.cryproject`
4. Build `tps-example/tps-client/solutions/Game.sln` solution in Visual Studio to provide the `tps-client` worker.
(See below section for more information)
5. Build `tps-example/game-worker/CsharpWorker.sln` solution in Visual Studio to provide the `game-worker` worker.
6. Run `spatial local launch` from the `tps-example` directory
7. Run any number of clients by right-clicking `Game.cryproject` and
selecting `Run Game` (or the exe generated from the `Package Build` option)

### Building tps-client
`tps-client` should only be built in the Profile or Release build
configuration - linking in the Debug configuration currently fails.
