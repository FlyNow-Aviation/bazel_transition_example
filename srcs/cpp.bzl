"""
"""

load("//srcs:change_platform.bzl", "change_platform_cc")

warning_opts = [
    "-W",
    "-Wall",
]

def cc_host2_library(name, visibility = ["//visibility:private"], target_compatible_with = [], **kwargs):
    name_cc = "cc_" + name
    cc_library(
        name = name_cc,
        copts = warning_opts,
        linkopts = [],
        linkstatic = True,
        target_compatible_with = target_compatible_with + [
            "//platforms:host2_target_constraint",
        ],
        **kwargs
    )
    change_platform_cc(
        name = name,
        deps = [name_cc],
        visibility = visibility,
    )

def cc_host1_binary(name, visibility = ["//visibility:private"], **kwargs):
    target_compatible_with = [
        "//platforms:host1_target_constraint",
    ]

    cc_binary(
        name = name,
        copts = warning_opts,
        target_compatible_with = target_compatible_with,
        visibility = visibility,
        **kwargs
    )

# next codelines:
# copied from cc_rules so these are not necessary any more.

_MIGRATION_TAG = "__CC_RULES_MIGRATION_DO_NOT_USE_WILL_BREAK__"

def _add_tags(attrs):
    if "tags" in attrs and attrs["tags"] != None:
        attrs["tags"] = attrs["tags"] + [_MIGRATION_TAG]
    else:
        attrs["tags"] = [_MIGRATION_TAG]
    return attrs

def cc_binary(**attrs):
    """Bazel cc_binary rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_binary
    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    native.cc_binary(**_add_tags(attrs))

def cc_test(**attrs):
    """Bazel cc_test rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_test
    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    native.cc_test(**_add_tags(attrs))

def cc_library(**attrs):
    """Bazel cc_library rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_library
    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    native.cc_library(**_add_tags(attrs))
