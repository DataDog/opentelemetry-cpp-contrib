#!/bin/sh

PS4='@ECHO@ line $LINENO: '
set -x
set -e

sudo yum group install -y "Development Tools"
sudo yum install -y automake libtool curl libcurl-devel zlib-devel git openssl-devel wget

BAZELISK_VERSION=v1.18.0

wget -O /tmp/bazelisk https://github.com/bazelbuild/bazelisk/releases/download/$BAZELISK_VERSION/bazelisk-linux-amd64
sudo mv /tmp/bazelisk /usr/local/bin/
chmod a+rx /usr/local/bin/bazelisk
