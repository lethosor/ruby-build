#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

os="$(uname)"
if is_linux; then
    dll="$(readlink libruby.so)"
    out="${dll}.gz"
    echo_run gzip -kv "$dll"
elif is_macos; then
    dll="$(readlink libruby.dylib)"
    out="${dll}.gz"
    echo_run gzip -kv "$dll"
elif is_windows; then
    dll=x*-vcruntime*-ruby*.dll
    out="${dll}.gz"
    echo_run gzip -kv "$dll"
else
    echo "unsupported OS: ${os}"
    echo_run ls -l
    exit 1
fi

du -h "$dll"
du -h "$out"

if [[ -n "$1" ]]; then
    if [[ -d "$1" ]]; then
        echo_run cp "$out" "$1"
    else
        echo "output directory not a directory: $1"
        exit 1
    fi
fi
