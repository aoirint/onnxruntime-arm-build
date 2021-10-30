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

ARG ONNXRUNTIME_VERSION=v1.9.0
RUN <<EOF
    git clone --recursive https://github.com/microsoft/onnxruntime.git
    cd onnxruntime

    git checkout "${ONNXRUNTIME_VERSION}"

    git submodule sync
    git submodule update --init --recursive --jobs 0
EOF

ARG BUILD_OPTS="--config Release --parallel --build_shared_lib"
RUN <<EOF
    cd onnxruntime
    bash ./build.sh ${BUILD_OPTS}
EOF
