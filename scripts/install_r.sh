CRAN=${CRAN:-https://cran.rstudio.com}


apt-get update \
	&& apt-get install -y --no-install-recommends \
		ed \
		less \
		locales \
		vim-tiny \
		wget \
		ca-certificates \
		fonts-texgyre


## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8


## Use Debian unstable via pinning -- new style via APT::Default-Release
echo "deb http://cloud.r-project.org/bin/linux/debian buster-cran40/" > /etc/apt/sources.list


## Now install R and littler, and create a link for littler in /usr/local/bin
apt-get update \
  && apt-get install -t buster-cran40 -y --no-install-recommends \
    gcc-9-base \
    libopenblas0-pthread \
    littler \
    r-cran-littler \
    r-base \
    r-base-dev \
    r-recommended \
&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
&& ln -s /usr/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r \
&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
&& install.r docopt \
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
&& rm -rf /var/lib/apt/lists/*

R --version

## Fix library path
sed -i '/^R_LIBS_USER=.*$/d' /usr/local/lib/R/etc/Renviron \
  && echo "R_LIBS_USER=\${R_LIBS_USER-'/usr/local/lib/R/site-library'}" >> /usr/local/lib/R/etc/Renviron \
  && echo "R_LIBS=\${R_LIBS-'/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library'}" >> /usr/local/lib/R/etc/Renviron

## Set configured CRAN mirror
echo "options(repos = c(CRAN='$CRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site


## Clean up from R source install
cd / \
  && rm -rf /tmp/* \
  && apt-get remove --purge -y $BUILDDEPS \
  && apt-get autoremove -y \
  && apt-get autoclean -y \
  && rm -rf /var/lib/apt/lists/*