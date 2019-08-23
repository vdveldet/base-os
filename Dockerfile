FROM ubuntu:bionic

MAINTAINER vdvelde.t@gmail.com
LABEL Description="Base OS for multiple Docker based on ubuntu:bionic" \
      version="1.0"

# Add default timezone
ENV LYBERTEAM_TIME_ZONE Europe/Brussels
RUN echo $LYBERTEAM_TIME_ZONE > /etc/timezone

# Modify user to group
RUN usermod -aG www-data www-data

# Install packages for PHP72
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  ca-certificates \
  git \
  gcc \
  make \
  wget \
  mc \
  curl \
  tzdata \
  sendmail && \
  DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common && \
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure -f noninteractive tzdata
