#!/bin/bash

FEED="/etc/opkg/eliesat-feed.conf"
left=">>>>"
right="<<<<"
LINE1="---------------------------------------------------------"
LINE2="-------------------------------------------------------------------------------------"

echo "$LINE1"
echo "> Installing dependencies be patient ...
> it takes 2 to 10 minutes please wait..."
echo "$LINE1"
sleep 5s

# Check python
pyVersion=$(python -c"from sys import version_info; print(version_info[0])")

deps=("wget" "alsa-utils-aplay" "alsa-plugins" "astra-sm" "bzip2" "curl" "duktape" "dvbsnoop" "exteplayer3" "ffmpeg" "gstplayer" "openvpn" "p7zip" "rtmpdump" "unrar" "zip" "xz")

if [ "$pyVersion" = 3 ]; then
  deps+=( "livestreamersrv" "python3-backports-lzma" "python3-beautifulsoup4" "python3-certifi" "python3-cfscrape" "python3-chardet" "python3-compression" "python3-core" "python3-e2icjson" "python3-image" "python3-js2py" "python3-imaging" "python3-lxml" "python3-multiprocessing" "python3-mmap" "python3-ndg-httpsclient" "python3-pillow" "python3-pkgutil" "python3-pycurl" "python3-pyexecjs" "python3-pysocks" "python3-pycrypto" "python3-pydoc" "python3-requests" "python3-six" "python3-shell" "python3-sqlite3" "python3-urllib3" "python3-xmlrpc" )
else
  deps+=( "python-core" "python-lzma" "python-lxml" "python-requests" "python-beautifulsoup4" "python-six" "python-sqlite3" "python-pycrypto" "python-argparse" "python-imaging" "python-multiprocessing" "python-pydoc" "python-mmap" "python-xmlrpc" "python-certifi" "python-urllib3" "python-chardet" "python-pysocks" "python-js2py" "python-pyexecjs" "f4mdump" "hlsdl" "python-pycurl" "python-image" "python-ndg-httpsclient" )
fi

if [ -f /etc/opkg/opkg.conf ]; then
  STATUS='/var/lib/opkg/status'
  OSTYPE='Opensource'
  OPKG='opkg update'
  OPKGINSTAL='opkg install'
elif [ -f /etc/apt/apt.conf ]; then
  STATUS='/var/lib/dpkg/status'
  OSTYPE='DreamOS'
  OPKG='apt-get update'
  OPKGINSTAL='apt-get install -y'
fi

install() {
  if ! grep -qs "Package: $1" "$STATUS"; then
    $OPKG >/dev/null 2>&1
    rm -rf /run/opkg.lock
    echo -e "> Need to install ${left} $1 ${right} please wait..."
    echo "$LINE2"
    sleep 0.8
    echo
    if [ "$OSTYPE" = "Opensource" ]; then
      $OPKGINSTAL "$1"
      sleep 1
      clear
    elif [ "$OSTYPE" = "DreamOS" ]; then
      $OPKGINSTAL "$1" -y
      sleep 1
      clear
    fi
  fi
}

for i in "${deps[@]}"; do
  install "$i"
done

rm -rf /var/cache/opkg/*

exit 0