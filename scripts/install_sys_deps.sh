#!/bin/bash

set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive


apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    curl

rm -rf /var/lib/apt/lists/*