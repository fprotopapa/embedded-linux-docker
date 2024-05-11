#!/bin/bash
export HOST_UID=$(id -u)
export HOST_GID=$(id -g)
mkdir -p bootloader toolchain kernel
docker compose $@