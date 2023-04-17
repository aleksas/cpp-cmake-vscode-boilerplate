FROM debian:bullseye as config

FROM config as dev

RUN apt-get update \
    && apt-get install -y git cmake build-essential gdb clang-format

RUN mkdir -p /root/workspaces

FROM dev as build

COPY . /root/workspaces/cpp-smake-vscode-boilerplate

RUN cmake -E make_directory /root/workspaces/cpp-smake-vscode-boilerplate \
    && cmake -S /root/workspaces/cpp-smake-vscode-boilerplate -B /root/workspaces/cpp-smake-vscode-boilerplate/build \
        -DCMAKE_INSTALL_PREFIX=/deploy \
    && cmake --build /root/workspaces/cpp-smake-vscode-boilerplate/build --target install -- -l

FROM config as deploy

COPY --from=build /deploy /
