# add --arm for gcc-8: https://github.com/microsoft/onnxruntime/issues/4189
# skip test: https://github.com/microsoft/onnxruntime/issues/2436
CONFIG=Release # Release, RelWithDebInfo
BUILD_OPTS=--arm --config $(CONFIG) --parallel --update --build --build_shared_lib

.PHONY: image-armhf
image-armhf:
	docker buildx build . \
		-t onnxruntime:armhf \
		--build-arg CC_VERSION=8 \
		--build-arg CXX_VERSION=8 \
		--build-arg ARCH=arm-linux-gnueabihf \
		--build-arg LD_SYMLINK_NAME=ld-linux-armhf.so.3 \
		--build-arg ATOMIC=1

.PHONY: build-armhf
build-armhf: image-armhf
	docker run --rm -it \
		-v "$(PWD)/build:/onnxruntime/build" \
		onnxruntime:armhf bash ./build.sh $(BUILD_OPTS)

.PHONY: bash-armhf
bash-armhf:
	docker run --rm -it onnxruntime:armhf bash
