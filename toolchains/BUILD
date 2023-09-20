load("toolchains.bzl", "toolchain_macro")
load("include_directory_paths.bzl", "host_include_dirs")

filegroup(
    name = "host_compiler_deps",
    srcs = [
        ":include_directory_paths",
    ],
)

host_tool_paths = {
    "ar": "/usr/bin/ar",
    "ld": "/usr/bin/ld",
    "cpp": "/usr/bin/clang++-15",
    "gcc": "/usr/bin/clang-15",
    "dwp": "/usr/bin/dwp",
    "gcov": "/usr/bin/gcov",
    "llvm-cov": "/usr/bin/llvm-cov-15",
    "nm": "/usr/bin/nm",
    "objcopy": "/usr/bin/objcopy",
    "objdump": "/usr/bin/objdump",
    "strip": "/usr/bin/strip",
}


host_compile_flags = [
    "-fPIC",
]

host_link_flags = [
    "-fuse-ld=/usr/bin/ld.gold",
    "-lstdc++",
    "-lm",
]

host_opt_compile_flags = [
    "-O2",
]

toolchain_macro(
    name = "host1_toolchain",
    compile_flags = host_compile_flags,
    compiler = "clang",
    compiler_deps = "host_compiler_deps",
    cpu = "x86_64",
    cxx_builtin_include_directories = host_include_dirs,
    link_flags = host_link_flags,
    opt_compile_flags = host_opt_compile_flags,
    target_compatible_with = [
        "//platforms:host1_target_constraint",
    ],
    tool_paths = host_tool_paths,
)

host2_compile_flags = host_compile_flags + [
    "-g",
]

toolchain_macro(
    name = "host2_toolchain",
    compile_flags = host2_compile_flags,
    compiler = "clang",
    compiler_deps = "host_compiler_deps",
    cpu = "x86_64",
    cxx_builtin_include_directories = host_include_dirs,
    link_flags = host_link_flags,
    opt_compile_flags = ["-O2"],
    target_compatible_with = [
        "//platforms:host2_target_constraint",
    ],
    tool_paths = host_tool_paths,
)
