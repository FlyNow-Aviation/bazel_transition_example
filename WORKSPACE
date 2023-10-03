load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/jdk:local_java_repository.bzl", "local_java_repository")

local_java_repository(
    name = "localjdk_11",
    java_home = "/usr/lib/jvm/java-11-openjdk-amd64",
    version = "11",
)

http_archive(
    name = "rules_python",
    sha256 = "e46612e9bb0dae8745de6a0643be69e8665a03f63163ac6610c210e80d14c3e4",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.0.3/rules_python-0.0.3.tar.gz",
)

load("@rules_python//python:repositories.bzl", "py_repositories")

register_toolchains(
    "//toolchains:all",
)
