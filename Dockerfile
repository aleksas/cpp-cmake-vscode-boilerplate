FROM debian:bullseye as config

FROM config as dev

RUN apt-get update \
    && apt-get install -y git cmake build-essential gdb clang-format
