#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

JOBS=3
if command_exists nproc; then
    JOBS=$(("$(nproc)" + 1))
fi

if is_unix; then
    echo_run make -j"${JOBS}" V=1 dll
else
    echo_run nmake config .rbconfig.time miniruby
    echo_run nmake dll
fi
