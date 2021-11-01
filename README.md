# onnxruntime-arm-build

Dockerfile to build ONNX Runtime for ARM CPU

- https://github.com/microsoft/onnxruntime

## ONNX Runtime version
ONNX Runtime version is fixed at v1.8.2.

v1.9.0, v1.9.1 is currently not working (missing `cpuid.h`).

## Build binary

```shell
sudo rm -rf build/
make build-armhf CONFIG=RelWithDebInfo
```
