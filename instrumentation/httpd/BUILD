load("@rules_cc//cc:defs.bzl", "cc_binary")

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "otel.so",
    linkshared = 1,
    # linkopts = ["-static-libstdc++", "-static-libgcc"],
    linkopts = ["-static"],
    deps = [
        "//src/otel:otelmodlib",
    ],
)
