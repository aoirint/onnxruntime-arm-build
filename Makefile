PLATFORM=linux/arm32v7
# add --arm for gcc-8: https://github.com/microsoft/onnxruntime/issues/4189
# skip test: https://github.com/microsoft/onnxruntime/issues/2436
BUILD_OPTS=--config Release --parallel --update --build --build_shared_lib

.PHONY: build
build:
	docker buildx build . --platform "$(PLATFORM)" -t onnxruntime

.PHONY: run
run:
	docker run --rm \
		-v "$(PWD)/build:/onnxruntime/build" \
		--platform "$(PLATFORM)" \
		-e "CC=gcc-7" \
		-e "CXX=g++-7" \
		onnxruntime bash ./build.sh $(BUILD_OPTS)

.PHONY: bash
bash:
	docker run --rm -it --platform "$(PLATFORM)" onnxruntime bash
