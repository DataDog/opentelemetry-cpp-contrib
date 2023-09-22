#!/bin/sh

PS4='@ECHO@ line $LINENO: '
set -x
set -e

# Note: from bazel's documentation:
#
#     --compilation_mode=<fastbuild, dbg or opt> [-c] default: "fastbuild"
#         Specify the mode the binary will be built in. Values: 'fastbuild', 'dbg', 'opt'.

bazelisk build --verbose_failures -c opt :all
