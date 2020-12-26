#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

if [[ "$RUBY_ARCH" = "32" ]]; then
    export CFLAGS="$CFLAGS -m32"
else
    export CFLAGS="$CFLAGS -m64"
fi

echo_run autoconf
echo_run ./configure --prefix="$RUBY_PREFIX" --enable-shared
