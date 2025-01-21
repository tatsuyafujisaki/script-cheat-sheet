# How to compile a `.proto` file into Dart files
1.  Install [protoc_plugin](https://pub.dev/packages/protoc_plugin), which includes the `protoc-gen-dart` command.
    ```shell
    dart pub global activate protoc_plugin
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    ```
    The same or similar instruction is found below.
    - https://grpc.io/docs/languages/dart/quickstart/
    - https://pub.dev/packages/protoc_plugin#how-to-build
1. Run `protoc`.
    ```shell
    protoc --proto_path=<input-proto-files-directory> \ # or use `-I`, which is the short form of `--proto_path`.
          --dart_out=grpc:<output-dart-files-directory> \
          <proto-filename>
    ```

## Example of compiling [health.proto](https://github.com/grpc/grpc/blob/master/src/proto/grpc/health/v1/health.proto) into Dart files
```shell
curl -O https://raw.githubusercontent.com/grpc/grpc/refs/heads/master/src/proto/grpc/health/v1/health.proto
protoc --dart_out=grpc:. health.proto
```

# Example of what adding [grpc:](https://pub.dev/documentation/protoc_plugin/latest/#generating-grpc-headers) to [protoc](https://grpc.io/docs/protoc-installation/) does to the generated Dart files

Use the following repository as an example.<br>
https://grpc.io/docs/languages/dart/basics/#example-code-and-setup

1. Prepare as follows.
```shell
git clone --depth 1 https://github.com/grpc/grpc-dart
cd grpc-dart/example/route_guide
rm lib/src/generated/*
```
1. Run `protoc` with and without the [grpc:](https://pub.dev/documentation/protoc_plugin/latest/#generating-grpc-headers) as follows to see how the generated files will vary in `lib/src/generated`.
```shell
# With `grpc:`
protoc --proto_path=protos --dart_out=grpc:lib/src/generated route_guide.proto

ls -1 lib/src/generated
# Output:
# route_guide.pb.dart
# route_guide.pbenum.dart
# route_guide.pbgrpc.dart <- 👀
# route_guide.pbjson.dart
```
```shell
# Without `grpc:`
protoc --proto_path=protos --dart_out=lib/src/generated route_guide.proto

ls -1 lib/src/generated
# Output:
# route_guide.pb.dart
# route_guide.pbenum.dart
# route_guide.pbjson.dart
# route_guide.pbserver.dart <- 👀
```
