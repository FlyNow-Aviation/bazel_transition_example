load("@rules_cc//cc:defs.bzl", "cc_toolchain")
load("@bazel_tools//tools/cpp:unix_cc_toolchain_config.bzl", "cc_toolchain_config")

def toolchain_macro(name, compiler_deps, target_compatible_with, compile_flags, compiler, cpu, cxx_builtin_include_directories, link_flags, tool_paths, link_libs = [], opt_compile_flags = [], supports_start_end_lib = True):
    native.filegroup(
        name = name + "_empty",
        srcs = [],
    )

    native.toolchain(
        name = name,
        target_compatible_with = target_compatible_with,
        toolchain = name + "_definition",
        toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    )

    cc_toolchain(
        name = name + "_definition",
        all_files = compiler_deps,
        ar_files = compiler_deps,
        as_files = compiler_deps,
        compiler_files = compiler_deps,
        dwp_files = name + "_empty",
        linker_files = compiler_deps,
        objcopy_files = name + "_empty",
        strip_files = name + "_empty",
        supports_param_files = 1,
        toolchain_config = name + "_config",
    )

    cc_toolchain_config(
        name = name + "_config",
        abi_libc_version = "local",
        abi_version = "local",
        compile_flags = compile_flags,
        compiler = compiler,
        coverage_compile_flags = ["--coverage"],
        coverage_link_flags = ["--coverage"],
        cpu = cpu,
        cxx_builtin_include_directories = cxx_builtin_include_directories,
        cxx_flags = [],
        dbg_compile_flags = ["-g"],
        host_system_name = "local",
        link_flags = link_flags,
        link_libs = link_libs,
        opt_compile_flags = opt_compile_flags,
        opt_link_flags = ["-Wl,--gc-sections"],
        supports_start_end_lib = supports_start_end_lib,
        target_libc = "local",
        target_system_name = "local",
        tool_paths = tool_paths,
        toolchain_identifier = "local",
        unfiltered_compile_flags = [
        ],
    )
