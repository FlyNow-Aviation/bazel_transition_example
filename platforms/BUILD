constraint_setting(name = "target")

constraint_value(
    name = "host1_target_constraint",
    constraint_setting = ":target",
    visibility = ["//visibility:public"],
)

constraint_value(
    name = "host2_target_constraint",
    constraint_setting = ":target",
    visibility = ["//visibility:public"],
)

platform(
    name = "host1_platform",
    constraint_values = [
        ":host1_target_constraint",
    ],
)

platform(
    name = "host2_platform",
    constraint_values = [
        ":host2_target_constraint",
    ],
)
