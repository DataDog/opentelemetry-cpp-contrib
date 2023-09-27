#!/bin/sh

PS4='@ECHO@ line $LINENO: '
set -x
set -e

#     --nostart_end_lib is an undocumented bazel build option that allows the
#     generated compiler command line flags to be understood by the default
#     linker, as opposed to requiring a more modern linker like gold.
#     The bazel build will use the gold linker (if availble), but then in our
#     subsequent relinking step, we must use the GNU linker for
#     "-static-libstdc++" and "-static-libgcc" support.
#
#     --verbose_failures is recommend by the output of bazel when compilation
#     fails.
#
#     --subcommands echos all of the commands (e.g. compiler invocations)
#     executed by the build. This is helpful to verify that changes to the build
#     definitions actually affect the build.
#
#     --compilation_mode=<fastbuild, dbg or opt> [-c] default: "fastbuild"
#         Specify the mode the binary will be built in. Values: 'fastbuild', 'dbg', 'opt'.
#
#     ":all" is the build target for everything, which in our case means the
#     Apache module and its dependencies.
bazelisk build --nostart_end_lib --verbose_failures --subcommands -c opt :all

# Now redo the final linking step, but use "g++" as the linking driver instead
# of "gcc". This is what it took to get the "-static-libstdc++" and
# "-static-libgcc" options to work.
# The resulting .so will be under httpd/ instead of under httpd/bazel-bin/
<bazel-out/k8-opt/bin/otel.so-2.params ./transform_params | tr '\n' '\0' | xargs -0 g++
