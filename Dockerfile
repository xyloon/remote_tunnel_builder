FROM golang:1.17-buster

RUN mkdir /binaries
VOLUME /binaries

COPY binary_build.sh /go 
ENTRYPOINT ["/bin/bash", "/go/binary_build.sh"]
