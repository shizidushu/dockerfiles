#!/bin/bash

set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive


apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    curl \
    gnupg2 \
    unixodbc \
    unixodbc-dev \
    libsodium-dev \
    libhiredis-dev \
    default-jdk
  
R CMD javarecon

rm -rf /var/lib/apt/lists/*