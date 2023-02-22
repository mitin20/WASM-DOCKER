# WASM-DOCKER

# ref: https://collabnix.com/docker-and-wasm-containers-better-

# Installing WASI

WASI is a modular system interface for WebAssembly.

First, download wasi from the following URL:

wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-16/wasi-sdk-16.0-macos.tar.gz
Next, Untar the WASI SDK

tar xvf wasi-sdk-16.0-macos.tar.gz

# Create a simple “Hello, Wasm” C Program.

 /* C program to print Hello Wasm! */

#include <stdio.h>

int main() {
   printf("Hello, Wasm!");
   return 0;
}

# Create a WASM module using WASI SDK

 export WASI_SDK_PATH=`pwd`/wasi-sdk-16.0
CC="${WASI_SDK_PATH}/bin/clang"
$CC hello-world.c -o hello-world.wasm
Verifying the file type

file hello-world.wasm 
hello-world.wasm: WebAssembly (wasm) binary module version 0x1 (MVP)

# Build a Docker Image

docker buildx build . --file=Dockerfile --tag=ajeetraina/hello-wasm-docker --platform wasi/wasm32

# Running the Wasm-based Docker Image

docker run --runtime=io.containerd.wasmedge.v1 --platform=wasi/wasm32 ajeetraina/hello-wasm-docker

