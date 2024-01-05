FROM debian:bookworm-slim

WORKDIR /opt/mojocker

RUN apt update && apt upgrade -y
RUN apt install -y curl python3.11-venv git

RUN curl https://get.modular.com | sh - && \
    modular auth mut_aa2c725fb42640a49f7eb580ef809833
RUN modular clean
RUN modular install mojo


SHELL [ "/bin/bash", "-c" ]
ENV PATH="/root/.modular/pkg/packages.modular.com_mojo/bin:${PATH}"


CMD mojo --help && /bin/bash -c "/bin/bash -l"
