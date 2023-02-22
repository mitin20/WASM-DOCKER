# syntax=docker/dockerfile:1
FROM scratch
COPY hello_world.wasm /hello_world.wasm
ENTRYPOINT [ "hello_world.wasm" ]
