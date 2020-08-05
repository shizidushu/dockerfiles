apt-get update
apt-get install -y --no-install-recommends gnupg ca-certificates dirmngr
rm -rf /var/lib/apt/lists/*

GHC=8.10.1
DEBIAN_KEY=427CB69AAC9D00F2A43CAF1CBA3CBA3FFE22B574
CABAL_INSTALL=3.2
STACK=2.3.1
STACK_KEY=C5705533DA4F78D8664B5DC0575159689BEFB442
STACK_RELEASE_KEY=2C6A674E85EE3FB896AFC9B965101FF31C5C154D

export GNUPGHOME="$(mktemp -d)"
gpg --batch --keyserver keyserver.ubuntu.com --recv-keys ${DEBIAN_KEY}
gpg --batch --armor --export ${DEBIAN_KEY} > /etc/apt/trusted.gpg.d/haskell.org.gpg.asc
gpgconf --kill all
echo 'deb http://downloads.haskell.org/debian buster main' > /etc/apt/sources.list.d/ghc.list
apt-get update
apt-get install -y haskell-platform