# How to convert a `.proto` file to Dart files
```shell
protoc --proto_path=<proto-files-directory> \
       --dart_out=grpc:<output-directory> \
       <path-to-proto-file>
```

# Example of what difference the [grpc option](https://pub.dev/documentation/protoc_plugin/latest/#generating-grpc-headers) to [protoc](https://grpc.io/docs/protoc-installation/) make in the generated Dart files

Use the following repository as an example.<br>
https://grpc.io/docs/languages/dart/basics/#example-code-and-setup

1. Prepare as follows.
```shell
git clone --depth 1 https://github.com/grpc/grpc-dart
cd grpc-dart/example/route_guide
rm lib/src/generated/*
```
2. Run `protoc` with and without the [grpc option](https://pub.dev/documentation/protoc_plugin/latest/#generating-grpc-headers) as follows to see how the generated files will vary in `lib/src/generated`.
```shell
# With the grpc option
protoc --proto_path=protos --dart_out=grpc:lib/src/generated route_guide.proto

ls -1 lib/src/generated
# Output:
# route_guide.pb.dart
# route_guide.pbenum.dart
# route_guide.pbgrpc.dart
# route_guide.pbjson.dart
```
```shell
# Without the grpc option
protoc --proto_path=protos --dart_out=lib/src/generated route_guide.proto

ls -1 lib/src/generated
# Output:
# route_guide.pb.dart
# route_guide.pbenum.dart
# route_guide.pbjson.dart
# route_guide.pbserver.dart
```
