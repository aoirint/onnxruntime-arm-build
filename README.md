# onnxruntime-arm-build

Dockerfile to build ONNX Runtime for ARM CPU

- https://github.com/microsoft/onnxruntime

Using Debian Buster based image, ONNX Runtime version is locked to v1.8.2
because ONNX Runtime v1.9.0 requires CMake 3.18 while Buster's CMake is 3.13.
