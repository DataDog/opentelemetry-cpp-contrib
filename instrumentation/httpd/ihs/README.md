Building for [IBM HTTP Server][1]
=================================
This directory contains build scripts that, together with modifications made to
bazel's `BUILD` and `WORKSPACE` files, allow this "otel.so" Apache module to be
built for compatibility with specific IBM HTTP Server versions running on
specific Linux distibutions.

Each subdirectory under this directory contains the build setup and
documentation for a particular Linux distribution. See their readmes for more
information.

[1]: https://www.ibm.com/docs/en/ibm-http-server
