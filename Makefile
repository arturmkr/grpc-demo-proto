PROTO_DIR=proto
GEN_DIR=$(PROTO_DIR)/generated

.PHONY: all clean python java

all: clean python java

clean:
	rm -rf $(GEN_DIR)

python:
	mkdir -p $(GEN_DIR)/python
	python -m grpc_tools.protoc -I$(PROTO_DIR) --python_out=$(GEN_DIR)/python --grpc_python_out=$(GEN_DIR)/python $(PROTO_DIR)/*.proto

java:
	mkdir -p $(GEN_DIR)/java
	protoc --proto_path=$(PROTO_DIR) --java_out=$(GEN_DIR)/java --grpc-java_out=$(GEN_DIR)/java $(PROTO_DIR)/*.proto