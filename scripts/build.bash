#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

JOBS=3
if command_exists nproc; then
    JOBS=$(("$(nproc)" + 1))
fi

echo_run make -j"${JOBS}" V=1 dll
