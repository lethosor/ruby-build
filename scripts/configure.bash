#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

export CFLAGS="-Os"

if [[ "$RUBY_ARCH" = "32" ]]; then
    export CFLAGS="$CFLAGS -m32"
    export ASFLAGS="$ASFLAGS -m32"
else
    export CFLAGS="$CFLAGS -m64"
    export ASFLAGS="$ASFLAGS -m64"
fi

os="$(uname)"
if [[ "$os" = "Darwin" ]]; then
    export CFLAGS="$CFLAGS -mmacosx-version-min=10.6"
fi

echo_run autoconf
echo_run ./configure --prefix="$RUBY_PREFIX" --enable-shared
