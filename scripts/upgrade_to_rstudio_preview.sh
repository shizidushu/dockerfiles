#!/bin/bash
set -e

DOWNLOAD_VERSION=`wget -qO - https://rstudio.com/products/rstudio/download/preview/ | grep -oP "(?<=rstudio-server-)[0-9]\.[0-9]\.[0-9]+" | sort | tail -n 1`

if [ "$UBUNTU_VERSION" = "xenial" ]; then
  wget $RSTUDIO_URL || \
  wget `echo $RSTUDIO_URL | sed 's/server-/server-xenial-/'` || \
  wget `echo $RSTUDIO_URL | sed 's/xenial/trusty/'`
else
  wget $RSTUDIO_URL
fi

dpkg -i rstudio-server-*-amd64.deb
rm rstudio-server-*-amd64.deb