# remote_tunnel_builder

This project making automation of binary build of the reverse-tunnel project(https://github.com/snsinfu/reverse-tunnel)

## Docker image build

```bash
docker build . -t rtunnel
```


## Making binaries for many OSs

```bash
mkdir target_directory

docker run -it -v (absolute path of target_directory):/binaries rtunnel
```

The binaries will be stored after the binary build in the target directory.

```
-\
 |-windows
 |    |-amd64
 |    |   |- rtun.exe
 |    |   \- rtun-server.exe
 |    \-arm64
 |        |- rtun.exe
 |        \- rtun-server.exe
 |-linux
 |    |-amd64
 |    |   |- rtun
 |    |   \- rtun-server
 |    \-arm64
 |        |- rtun
 |        \- rtun-server
 \-darwin
      |-amd64
      |   |- rtun
      |   \- rtun-server
      \-arm64
          |- rtun
          \- rtun-server
```
