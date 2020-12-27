#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash

set -e
cd_build

destdir="$1"
if [[ -z "$destdir" ]]; then
    echo "usage: $0 DESTDIR"
    exit 2
fi
echo_run mkdir -p "$destdir"

os="$(uname)"
if is_linux; then
    dll="$(readlink libruby.so)"
    suffix=so
elif is_macos; then
    dll="$(readlink libruby.dylib)"
    suffix=dylib
elif is_windows; then
    dll="$(ls x*-vcruntime*-ruby*.dll | head -n1)"
    suffix=dll
else
    echo "unsupported OS: ${os}"
    echo_run ls -l
    exit 1
fi

if [[ ! -f "$dll" ]]; then
    echo "ruby library not found: ${dll}"
    echo_run ls -l
    exit 1
fi

outname="libruby-${RUBY_VERSION//./-}.${suffix}"
out="${destdir}/${outname}"

echo_run cp "$dll" "$out"
echo_run gzip -v "$out"

du -h "$dll"
du -h "${out}.gz"
