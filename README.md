# onnxruntime-arm-build

Dockerfile to build ONNX Runtime for ARM CPU

- https://github.com/microsoft/onnxruntime

For Debian Buster-based images,
ONNX Runtime v1.9.0 requires CMake 3.18,
but Buster's CMake is 3.13,
so the ONNX Runtime version is fixed at v1.8.2.
