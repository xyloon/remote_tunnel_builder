#!/bin/bash

build_list=(
    "windows amd64"
    "windows arm64"
    "darwin amd64"
    "darwin arm64"
    "linux amd64"
    "linux arm64"
)

git clone https://github.com/snsinfu/reverse-tunnel
cd reverse-tunnel/



DIRBASE="/binaries"

for build_one_item in "${build_list[@]}"; do
    IFS=' ' read -r -a build_info <<< "$build_one_item"
    GOOS="${build_info[0]}"
    GOARCH="${build_info[1]}"
    make
    mkdir -p "$DIRBASE/$GOOS/$GOARCH"
    if [ "$GOOS" == "windows" ]; then
        mv rtun "$DIRBASE/$GOOS/$GOARCH/rtun.exe"
        mv rtun-server "$DIRBASE/$GOOS/$GOARCH/rtun-server.exe"
    else
        chmod +x rtun
        chmod +x rtun-server
        mv rtun "$DIRBASE/$GOOS/$GOARCH/rtun"
        mv rtun-server "$DIRBASE/$GOOS/$GOARCH/rtun-server"
    fi

done
