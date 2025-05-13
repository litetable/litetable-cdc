.PHONY: proto

# var to describe the directory to the compile version
PROTO_DIR := ./proto/v1/change_data_capture.proto

proto: ## Regenerate all proto
	protoc --go_out=. --go-grpc_out=. ${PROTO_DIR} && \
    cd node && ./generate-node-proto.sh .${PROTO_DIR}
