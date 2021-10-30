# syntax=docker/dockerfile:1.3-labs
ARG BASE_IMAGE=arm32v7/python:3.7.12-buster
FROM ${BASE_IMAGE}

RUN <<EOF
    apt-get update
    apt-get install -y \
        build-essential \
        cmake \
        git
EOF

# v1.9.0 requires CMake 3.18 or higher. CMake on Debian buster is 3.13.
ARG ONNXRUNTIME_VERSION=v1.8.2
RUN <<EOF
    git clone --recursive https://github.com/microsoft/onnxruntime.git
    cd onnxruntime

    git checkout "${ONNXRUNTIME_VERSION}"

    git submodule sync
    git submodule update --init --recursive --jobs 0
EOF

WORKDIR /onnxruntime
