load("@io_grpc_grpc_java//:java_grpc_library.bzl", "java_grpc_library")
load("@rules_java//java:defs.bzl", "java_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_grpc_library", "swift_proto_library")

proto_library(
    name = "service_proto",
    srcs = ["service.proto"],
    deps = [
        ":requests_responses_proto",
        "//protos/model:model_proto",
        "@com_google_googleapis//google/type:latlng_proto",
        "@com_google_googleapis//google/type:phone_number_proto",
        "@com_google_protobuf//:empty_proto",
        "@com_google_protobuf//:wrappers_proto",
    ],
)

java_proto_library(
    name = "service_java_proto",
    visibility = ["//visibility:public"],
    deps = [":service_proto"],
)

proto_library(
    name = "requests_responses_proto",
    srcs = glob(
        ["*.proto"],
        exclude = ["service.proto"],
    ),
    deps = [
        "//protos/model:model_proto",
        "@com_google_googleapis//google/type:latlng_proto",
        "@com_google_googleapis//google/type:phone_number_proto",
        "@com_google_protobuf//:empty_proto",
        "@com_google_protobuf//:wrappers_proto",
    ],
)

java_proto_library(
    name = "requests_responses_java_proto",
    visibility = ["//visibility:public"],
    deps = [":requests_responses_proto"],
)

java_grpc_library(
    name = "service_java_grpc",
    srcs = [":service_proto"],
    visibility = ["//visibility:public"],
    deps = [":service_java_proto"],
)

swift_proto_library(
    name = "service_swift_proto",
    deps = [":service_proto"],
)

swift_grpc_library(
    name = "service_swift_services_grpc",
    srcs = [":service_proto"],
    flavor = "client",
    deps = [":service_swift_proto"],
)

swift_grpc_library(
    name = "service_swift_stubs_grpc",
    srcs = [":service_proto"],
    flavor = "client_stubs",
    visibility = ["//visibility:public"],
    deps = [":service_swift_services_grpc"],
)
