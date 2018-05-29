FROM debian:latest
RUN apt-get update && apt-get install -y gcc make libfuse-dev
ADD . /dist
WORKDIR /dist
RUN make
CMD ./run.sh
