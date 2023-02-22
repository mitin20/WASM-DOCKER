# syntax=docker/dockerfile:1
FROM scratch
COPY hello-world.wasm /hello-world.wasm
ENTRYPOINT [ "hello-world.wasm" ]
