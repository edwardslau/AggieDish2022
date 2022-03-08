# See https://docs.bazel.build/versions/master/build-ref.html#BUILD_files

load("@rules_java//java:defs.bzl", "java_binary")

java_binary(
    name = "server",
    srcs = glob([
        "src/main/java/com/mealteam/server/*.java",
        "src/main/java/com/mealteam/common/*.java",
    ]),
    main_class = "com.mealteam.server.VendorServer",
    deps = [
        "//protos:requests_responses_java_proto",
        "//protos:service_java_grpc",
        "//protos/model:model_java_proto",
        "@com_google_protobuf//:protobuf_java",
        "@com_google_protobuf//:protobuf_java_util",
        "@io_grpc_grpc_java//api",
        "@io_grpc_grpc_java//netty",
        "@io_grpc_grpc_java//protobuf",
        "@io_grpc_grpc_java//stub",
        "@maven//:com_google_api_grpc_proto_google_common_protos",
        "@maven//:com_google_code_findbugs_jsr305",
        "@maven//:com_google_code_gson_gson",
        "@maven//:com_google_guava_guava",
        "@maven//:org_mongodb_mongo_java_driver",
    ],
)

java_binary(
    name = "test_client",
    srcs = glob([
        "src/main/java/com/mealteam/client/*.java",
        "src/main/java/com/mealteam/common/*.java",
    ]),
    main_class = "com.mealteam.client.TestClient",
    deps = [
        "//protos:requests_responses_java_proto",
        "//protos:service_java_grpc",
        "//protos:service_java_proto",
        "//protos/model:model_java_proto",
        "@com_google_protobuf//:protobuf_java",
        "@com_google_protobuf//:protobuf_java_util",
        "@io_grpc_grpc_java//api",
        "@io_grpc_grpc_java//netty",
        "@io_grpc_grpc_java//protobuf",
        "@io_grpc_grpc_java//stub",
        "@maven//:com_google_api_grpc_proto_google_common_protos",
        "@maven//:com_google_code_findbugs_jsr305",
        "@maven//:com_google_code_gson_gson",
        "@maven//:com_google_guava_guava",
    ],
)
