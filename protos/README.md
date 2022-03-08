# Proto files

A note for Visual Studio Code:add every file in
`./bazel-out/[system-type]-fastbuild/bin/protos/` that ends with `java_grpc.jar`
and `*proto-speed.jar` to the java project's referenced libraries section.

This will give your two things:
- It will stop highlighting the import for the package as an error
- It will allow you to see the names and return types of the functions in these classes.
