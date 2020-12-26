#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e

os="$(uname)"
if [[ "$os" = "Linux" ]]; then
    if [[ "$RUBY_ARCH" = "32" ]]; then
        echo_run sudo apt-get install gcc-multilib g++-multilib
    fi
fi
