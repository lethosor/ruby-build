#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

if is_unix; then
    echo_run make test
else
    echo_run test "$(./miniruby -e 'puts RUBY_VERSION')" = "$RUBY_VERSION"
    echo_run nmake test-basic
fi
