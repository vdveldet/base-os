FROM ubuntu:bionic

MAINTAINER vdvelde.t@gmail.com
LABEL Description="Base OS for multiple Docker based on ubuntu:bionic" \
      version="0.1"

# Add default timezone
ENV LYBERTEAM_TIME_ZONE Europe/Brussels
RUN echo $LYBERTEAM_TIME_ZONE > /etc/timezone

# Update initial image
RUN apt-get update -yqq

# Modify user to group
RUN usermod -aG www-data www-data

# Install packages for PHP72
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yqq \
    ca-certificates \
    git \
    gcc \
    make \
    wget \
    mc \
    curl \
    tzdata \
    sendmail

RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN DEBIAN_FRONTEND=noninteractive LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/nginx-mainline

# Reconfigure system time
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure -f noninteractive tzdata
