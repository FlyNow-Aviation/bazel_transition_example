load("//srcs:cpp.bzl", "cc_host2_library", "cc_host1_binary")
load("//srcs:py.bzl", "py_to_txt_file")

cc_host2_library(
    name = "add",
    srcs = ["add.cpp"],
    hdrs = ["add.hpp"],
)

py_to_txt_file(
    name = "return_a",
    output_filename = "return_a.hpp",
    python_script = "generator.py",
    add_args = "--function_name \"return_a\" --to_return \"a\""
)

py_to_txt_file(
    name = "return_b",
    output_filename = "return_b.hpp",
    python_script = "generator.py",
    add_args = "--function_name \"return_b\" --to_return \"b\""
)

py_to_txt_file(
    name = "return_c",
    output_filename = "return_c.hpp",
    python_script = "generator.py",
    add_args = "--function_name \"return_c\" --to_return \"c\""
)

filegroup(
    name = "return_fg",
    srcs = [
        "return_a.hpp",
        "return_b.hpp",
        "return_c.hpp",
    ],
)

cc_host2_library(
    name = "returner",
    hdrs = [
        ":return_fg",
        "returner.hpp",
    ],
    srcs = ["returner.cpp"]
)

cc_host1_binary(
    name = "main",
    srcs = ["main.cpp"],
    deps = [
        ":add",
        ":returner"
    ],
)

