"""
"""
load("@rules_python//python:defs.bzl", "py_binary")

def py_binary_host1(**kwargs):
    py_binary(
        target_compatible_with = [
            "@//platforms:host1_target_constraint",
        ],
        **kwargs
    )


def py_to_txt_file(
        name,
        output_filename,
        python_script,
        add_args = "",
        visibility = ["//visibility:private"]):

    output_location = "$(location " + output_filename + ")"

    py_binary_host1(
        name = name + "_python",
        srcs = [python_script],
        main = python_script,
    )

    native.genrule(
        name = name + "_genrule",
        tools = [":" + name + "_python"],
        srcs = [],
        outs = [output_filename],
        cmd = "$(location :" + name + "_python) " + add_args + " --output_filename " + output_location,
        visibility = visibility,
    )
