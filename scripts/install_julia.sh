#!/bin/bash

set -e

JULIA_PATH=${JULIA_PATH:-/usr/local/julia}
PATH={$PATH:-$PATH:$JULIA_PATH/bin}

JULIA_VERSION=${JULIA_VERSION:-1.4.2}
folder="$(echo "$JULIA_VERSION" | cut -d. -f1-2)"

curl -fL -o julia.tar.gz "https://julialang-s3.julialang.org/bin/linux/x64/${folder}/julia-${JULIA_VERSION}-linux-x86_64.tar.gz"
mkdir "$JULIA_PATH"
tar -xzf julia.tar.gz -C "$JULIA_PATH" --strip-components 1
rm julia.tar.gz
julia --version
echo "options(JULIA_HOME='$JULIA_PATH/bin/')" >> /usr/local/lib/R/etc/Rprofile.site