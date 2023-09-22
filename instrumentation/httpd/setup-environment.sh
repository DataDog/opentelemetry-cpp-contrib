#!/bin/sh

PS4='@ECHO@ line $LINENO: '
set -x
set -e

sudo yum update -y
sudo yum install -y httpd-devel
