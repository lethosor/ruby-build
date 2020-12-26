#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e

os="$(uname)"
if is_linux; then
    if [[ "$RUBY_ARCH" = "32" ]]; then
        echo_run sudo apt-get install gcc-multilib g++-multilib
    fi
fi
