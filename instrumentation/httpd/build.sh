#!/bin/sh

PS4='@ECHO@ line $LINENO: '
set -x
set -e

# Note: from bazel's documentation:
#
#     --compilation_mode=<fastbuild, dbg or opt> [-c] default: "fastbuild"
#         Specify the mode the binary will be built in. Values: 'fastbuild', 'dbg', 'opt'.

bazelisk build --nostart_end_lib --verbose_failures --subcommands -c opt :all

# Now redo the final linking step, but use "g++" as the linking driver instead
# of "gcc". This allows the "-static-libstdc++" and "-static-libgcc" options to
# work more easily.
<bazel-out/k8-opt/bin/otel.so-2.params ./transform_params | tr '\n' '\0' | xargs -0 g++
