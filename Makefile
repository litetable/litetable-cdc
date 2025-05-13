.PHONY: proto

# var to describe the directory to the compile version
PROTO_DIR := ./proto/v1/change_data_capture.proto

proto: ## Regenerate all proto
	protoc --go_out=. --go-grpc_out=. ${PROTO_DIR} && \
    cd node && ./generate-node-proto.sh .${PROTO_DIR}

cdc-test: ## run a grpcurl command to start a mock listener
	grpcurl \
      -plaintext \
      -proto ./proto/v1/change_data_capture.proto \
      -d '{"client_id": "debug-client", "replay": false}' \
      127.0.0.1:32473 \
      litetable.cdc.v1.CDCService.CDCStream
