FROM ubuntu:20.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . /src
COPY . /exec
COPY . /logs

WORKDIR exec

RUN cmake -H. -B_build
RUN cmake -build _build

ENV LOG_PATH ../logs/log.txt

VOLUME ../logs

ENTRYPOINT [ "./example1" ]
ENTRYPOINT [ "./example2", LOG_PATH ]
