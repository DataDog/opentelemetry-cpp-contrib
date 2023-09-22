load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "otelmodlib",
    srcs = glob(["*.cpp"]),
    hdrs = glob(["*.h"]),
    copts = [
        "-Iexternal/IHS",
    ],
    deps = [
        "@IHS//:headers",
        "@io_opentelemetry_cpp//api",
        "@io_opentelemetry_cpp//exporters/ostream:ostream_span_exporter",
        "@io_opentelemetry_cpp//exporters/otlp:otlp_exporter",
        "@io_opentelemetry_cpp//sdk/src/trace",
    ],
    alwayslink = 1,
    linkstatic = 1,
)
