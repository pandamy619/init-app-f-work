# Base image 
FROM ubuntu:22.04
# Not installing suggested or recommended dependencies
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
# Preventing prompt errors during package installation
RUN DEBIAN_FRONTEND=noninteractive

# Run as root user
USER root

WORKDIR /app

RUN mkdir config

COPY ./init_work.sh ./config/init_work.sh
COPY ./oslib ./config/oslib
COPY ./package.txt ./config/package.txt

RUN ["/bin/bash", "-c", "./config/init_work.sh"]
