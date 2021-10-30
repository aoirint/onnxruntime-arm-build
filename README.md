# onnxruntime-arm-build

Dockerfile to build ONNX Runtime for ARM CPU

- https://github.com/microsoft/onnxruntime

## ONNX Runtime
ONNX Runtime v1.9.0 requires CMake 3.18.

We want to use Debian Buster-based images for compatibility,
but Buster's CMake is 3.13.

So the ONNX Runtime version is fixed at v1.8.2.
