# How to convert a `.proto` file to Dart files
```shell
protoc --proto_path=<path-to-input-directory-that-contains-proto-files> \
       --dart_out=grpc:<path-to-output-directory> \
       <path-to-proto-file>
```
