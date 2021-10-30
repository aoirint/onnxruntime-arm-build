PLATFORM=linux/arm32v7
BUILD_OPTS=--config Release --parallel --build_shared_lib

.PHONY: build
build:
	docker buildx build . --platform "$(PLATFORM)" -t onnxruntime

.PHONY: run
run:
	docker run --rm -it -v "$(PWD)/build:/onnxruntime/build" --platform "$(PLATFORM)" onnxruntime bash ./build.sh $(BUILD_OPTS)
