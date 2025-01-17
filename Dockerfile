FROM debian:latest
RUN apt-get update && apt-get install -y gcc make libfuse-dev pkg-config
ADD . /dist
WORKDIR /dist
RUN make
