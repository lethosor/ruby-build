#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

echo_run autoconf
echo_run ./configure --prefix="$RUBY_PREFIX" --enable-shared
