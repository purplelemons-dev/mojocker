#FROM python:3.11.7-bullseye
FROM debian:bookworm

WORKDIR /opt/mojocker

#COPY requirements.txt .
#RUN pip install -r requirements.txt

#RUN apt update
RUN apt update && apt upgrade -y
RUN apt install -y curl python3.11-venv git

RUN curl https://get.modular.com | sh - && \
    modular auth mut_aa2c725fb42640a49f7eb580ef809833

#RUN curl https://get.modular.com | sh - && modular auth mut_aa2c725fb42640a49f7eb580ef809833
#RUN apt-get install -y apt-transport-https && \
#    keyring_location=/usr/share/keyrings/modular-installer-archive-keyring.gpg && \
#    curl -1sLf 'https://dl.modular.com/bBNWiLZX5igwHXeu/installer/gpg.0E4925737A3895AD.key' |  gpg --dearmor >> ${keyring_location} && \
#    curl -1sLf 'https://dl.modular.com/bBNWiLZX5igwHXeu/installer/config.deb.txt?distro=debian&codename=wheezy' > /etc/apt/sources.list.d/modular-installer.list && \
#    apt-get update && \
#    apt upgrade -y && \
#    apt-get install -y modular

RUN modular clean
RUN modular install mojo

#RUN exec bash


#SHELL [ "/bin/bash", "-l", "-c" ]
#COPY intro.sh /opt/mojocker

SHELL [ "/bin/bash", "-c" ]
ENV PATH="/root/.modular/pkg/packages.modular.com_mojo/bin:${PATH}"


CMD mojo --help && /bin/bash -c "/bin/bash -l"
