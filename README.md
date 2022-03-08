## Guide

### Set Up Development Environment

1. Install [Homebrew](https://brew.sh).
1. Install [Bazelisk](https://github.com/bazelbuild/bazelisk).
   - `brew install bazelisk`
1. Install [Buildifier](https://github.com/bazelbuild/buildtools/tree/master/buildifier).
   - `brew install buildifier`

### Run the Server

1. Obtain the database credentials JSON file.
1. `bazel run //server:server -- /absolute/path/to/credentials.json`

After the server starts, you should see the following output:

```console
INFO: Server has started on port 8980
```

### Run the Test Client

```shell
bazel run //server:test_client -- localhost 8980
```

The test client should establish a connection to the server and print any data
received from the server. For example, if you uncommented `client.getEateries()`
in `TestClient.main()`, a list of all eateries should be printed:

```console
---- Eatery ----
Mid: value: 2
Name: value: "Latitude"
Cuisine: value: "Multi-Cuisine"
```

If none of the methods in `TestClient.main()` are uncommented, then no output
will be printed.

### Run the UniDish iOS App (Deprecated)
1. Run `bazel run @rules_pods//:update_pods -- --src_root $PWD` to build all the
   local and remote CocoaPods dependencies for the iOS application. These will
   be stored in the `Vendor/` directory in the root directory of the repository.
   (Note: If you'd like to remove and install fresh CocoaPods, do not delete the
   `Vendor/` directory entirely, as the `Vendor/rules_pods/` directory contains
   CocoaPods rules that are not replaced when updating CocoaPods.)
1. (Method 1) `bazel run //client/UniDish:ios-app` This builds the iOS
   application and runs it in a simulator. Not recommended, as the only option
   for simulating is a 7th generation iPod touch.
1. (Method 2)
    1. Download and install Tulsi for MacOS.
    1. Select open existing project.
    1. Navigate to `client/UniDish/UniDish.tulsiproj` and select it.
    1. Click configs and click generate.
    1. Select and output directory for the generated Xcode project (Note: The
       output directory must be specified, and it cannot be any subdirectory of
       the project. Otherwise Bazel will detect the BUILD files within the
       generated Xcode project and create an infinite symlink.)
    1. Run the application as you normally would in Xcode.
1. (Method 3) Generate the project via script
    `./scripts/generate_xcodeproj.sh --genconfig client/UniDish/UniDish.tulsiproj --outputfolder <output-directory-name>`
    (Note: The output directory must be specified, and it cannot be any
    subdirectory of the project. Otherwise Bazel will detect the BUILD files
    within the generated Xcode project and create an infinite symlink.)
