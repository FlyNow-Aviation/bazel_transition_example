"""
"""

def _change_platform_transition_impl(settings, attr):
    platform_mapping = {
        Label("//platforms:host1_platform"): Label("//platforms:host2_platform"),
    }

    if (len(settings["//command_line_option:platforms"]) != 1):
        fail(["only exactly one platform from commandline is supported by transition!"])
    current_platform = settings["//command_line_option:platforms"][0]
    new_platform = platform_mapping.get(current_platform, current_platform)
    return {"//command_line_option:platforms": [new_platform]}

change_platform_transition = transition(
    implementation = _change_platform_transition_impl,
    inputs = ["//command_line_option:platforms"],
    outputs = ["//command_line_option:platforms"],
)

def _empty_impl_cc(ctx):
    return [dep[CcInfo] for dep in ctx.attr.deps]

change_platform_cc = rule(
    implementation = _empty_impl_cc,
    cfg = change_platform_transition,
    attrs = {
        "deps": attr.label_list(providers = [CcInfo]),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    fragments = ["cpp"],
)
