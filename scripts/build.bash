#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

JOBS=3
if command_exists nproc; then
    JOBS="$(nproc)"
fi

echo_run make -j"${JOBS}" dll
