.PHONY: build
build:
	docker buildx build . --platform linux/arm32v7 -t onnxruntime

.PHONY: run
run:
	docker run --rm -it onnxruntime

