#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

os="$(uname)"
export CFLAGS="-Os"

if is_linux; then
    if [[ "$RUBY_ARCH" = "32" ]]; then
        export CFLAGS="$CFLAGS -m32"
        export ASFLAGS="$ASFLAGS -m32"
    else
        export CFLAGS="$CFLAGS -m64"
        export ASFLAGS="$ASFLAGS -m64"
    fi
elif is_macos; then
    export CC=gcc-10
    export CXX=g++-10
fi

if is_unix; then
    echo_run autoconf
    echo_run ./configure --prefix="$RUBY_PREFIX" --enable-shared
else
    echo_run ./win32/configure.bat --enable-shared
fi
