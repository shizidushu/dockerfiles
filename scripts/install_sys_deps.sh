#!/bin/bash

set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive


apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    apt-transport-https \
    curl \
    gnupg2 \
    default-jdk \
    fonts-wqy-zenhei \
    libglu1-mesa-dev \
    libgit2-dev \
    libgl1-mesa-dev  \
    libhiredis-dev \
    libsodium-dev \
    tdsodbc \
    libsqliteodbc \
    odbc-postgresql \
    unixodbc \
    unixodbc-dev \
    xtail \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libjq-dev \
    libprotobuf-dev \
    protobuf-compiler \
    unzip \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    wget
  
# R CMD javareconf

rm -rf /var/lib/apt/lists/*