#!/bin/bash
set -e

DOWNLOAD_VERSION=`wget -qO - https://rstudio.com/products/rstudio/download/preview/ | grep -oP "(?<=rstudio-server-)[0-9]\.[0-9]\.[0-9]+" | sort | tail -n 1`


## UBUNTU_VERSION is not generally valid: only works for xenial and bionic, not other releases,
## and does not understand numeric versions. (2020-04-15)
#RSTUDIO_URL="https://s3.amazonaws.com/rstudio-ide-build/server/${UBUNTU_VERSION}/amd64/rstudio-server-${DOWNLOAD_VERSION}-amd64.deb"
## hardwire bionic for now...
RSTUDIO_URL="https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/rstudio-server-${DOWNLOAD_VERSION}-amd64.deb"

if [ "$UBUNTU_VERSION" = "xenial" ]; then
  wget $RSTUDIO_URL || \
  wget `echo $RSTUDIO_URL | sed 's/server-/server-xenial-/'` || \
  wget `echo $RSTUDIO_URL | sed 's/xenial/trusty/'`
else
  wget $RSTUDIO_URL
fi

dpkg -i rstudio-server-*-amd64.deb
rm rstudio-server-*-amd64.deb