1. Generated from https://github.com/tronprotocol/protocol
2. install-googleapis.sh is not working - fetch Google API from somewhere else
3. Generate Elixir client

Based on https://github.com/tronprotocol/java-tron/blob/master/protocol/src/main/protos/.travis.yml
But just with any.proto

mkdir lib
protoc -I=. --elixir_out=plugins=grpc:./lib/ ./core/*.proto ./api/*.proto
protoc -I=. --elixir_out=plugins=grpc:./lib protobuf-3.5.1/src/google/protobuf/any.proto 