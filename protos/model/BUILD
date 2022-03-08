load("@rules_java//java:defs.bzl", "java_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_proto_library")

proto_library(
    name = "model_proto",
    srcs = glob(["*.proto"]),
    visibility = ["//visibility:public"],
    deps = [
        "@com_google_googleapis//google/type:latlng_proto",
        "@com_google_googleapis//google/type:phone_number_proto",
        "@com_google_googleapis//google/type:timeofday_proto",
        "@com_google_protobuf//:wrappers_proto",
    ],
)

java_proto_library(
    name = "model_java_proto",
    visibility = ["//visibility:public"],
    deps = [":model_proto"],
)

swift_proto_library(
    name = "model_swift_proto",
    visibility = ["//visibility:public"],
    deps = [":model_proto"],
)
