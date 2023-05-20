# Base image 
FROM ubuntu:22.04
# Not installing suggested or recommended dependencies
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
# Preventing prompt errors during package installation
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y python3 \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash apprunner

USER apprunner
