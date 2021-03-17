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
    libcurl4-openssl-dev \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libjq-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libssl-dev \
    libbz2-dev \
    libv8-dev \
    unzip \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    libpcre2-dev \
    wget

apt-get install -y libpoppler-cpp-dev

rm -rf /var/lib/apt/lists/*