# Base image 
FROM ubuntu:22.04
# Not installing suggested or recommended dependencies
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
# Preventing prompt errors during package installation
RUN DEBIAN_FRONTEND=noninteractive
# Run as non-root user
# RUN useradd -ms /bin/bash apprunner
# USER apprunner

# Run as root user
USER root

WORKDIR /app

COPY ./init_work.sh app/init_work.sh
# RUN chmod +x app/init_work.sh
# RUN ["chmod", "+x", "./init_work.sh"]
RUN ["/bin/bash", "-c", "app/init_work.sh"]
