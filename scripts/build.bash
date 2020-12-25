#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

JOBS=3
if command_exists nproc; then
    JOBS=$(("$(nproc)" + 1))
fi

if [[ "$RUBY_ARCH" = "32" ]]; then
    export CFLAGS="$CFLAGS -m32"
else
    export CFLAGS="$CFLAGS -m64"
fi

echo_run make -j"${JOBS}" dll
