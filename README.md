# Bazel transition toolchain example

This is an example for using bazel toolchains / platforms (the new way) with C++ in combination with bazel transitions. 

## structure

The toolchains are configured in the toolchains/BUILD file, the platforms are set up in platforms/BUILD. For the toolchains the pathes are hardcoded in toolchains/include_directory_paths / toolchains/include_directory_paths.bzl and must be changed to real pathes used. To shorten up toolchain generation there is a bazel macro in toolchains/toolchains.bzl. At the moment, two toolchains are created, host1_toolchain and host2_toolchain. Both have a unique constraint connecting them to two platforms, host1_platform or host2_platform.

## source code

In the source code folder, there are two libraries generated. The first, the add lib, is created with host1 toolchain and linked to main host1 binary. The second, the returner lib, that compiles on host2 and is connected with transition on host1 binary. The source files are additional generated by a python script (srcs/generator.py).

Build with:

```bash
bazel build //...
```

and run with

```bash
bazel run //srcs:main
```
