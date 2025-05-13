#!/usr/bin/env bash

set -euo pipefail

PROTO_FILE="$1"
OUT_BASE="generated"
PROTOC_BIN="./node_modules/.bin/grpc_tools_node_protoc"

if [[ ! -f "$PROTO_FILE" ]]; then
  echo "❌  Proto file not found: $PROTO_FILE"
  exit 1
fi

if [[ ! -x "$PROTOC_BIN" ]]; then
  echo "❌  grpc_tools_node_protoc not found at $PROTOC_BIN"
  echo "Did you run 'npm install grpc-tools'?"
  exit 1
fi

# Extract go_package option
GO_PACKAGE=$(grep "option go_package" "$PROTO_FILE" | sed -E 's/.*"([^"]+)".*/\1/')

# Extract path before semicolon (if any)
PACKAGE_PATH="${GO_PACKAGE%%;*}"

# Remove any leading "go/" prefix
CLEAN_PATH=$(echo "$PACKAGE_PATH" | sed -E 's#^go/##')

# Final Node output dir
NODE_OUT_DIR="$OUT_BASE/$CLEAN_PATH"

echo "→ Generating Node gRPC code for $PROTO_FILE"
echo "→ Output directory: $NODE_OUT_DIR"

mkdir -p "$NODE_OUT_DIR"

"$PROTOC_BIN" \
  --js_out=import_style=commonjs,binary:"$NODE_OUT_DIR" \
  --grpc_out=grpc_js:"$NODE_OUT_DIR" \
  --proto_path="$(dirname "$PROTO_FILE")" \
  "$PROTO_FILE"

echo "✅  Done."
