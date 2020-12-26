#!/usr/bin/env bash

cd "$(dirname "$0")"
. common.inc.bash
cd ..

set -e

version="$1"
dest="$2"
if [[ -z "$version" ]] || [[ -z "$dest" ]]; then
    echo "usage: $0 VERSION DESTDIR"
    exit 2
fi
mkdir -p "$dest"
version_first2="$(echo "$version" | cut -d . -f 1-2)"
dest_tar="ruby-${version}.tar.gz"

wget --continue "https://cache.ruby-lang.org/pub/ruby/${version_first2}/ruby-${version}.tar.gz" --output-document "${dest_tar}"
tar xf "${dest_tar}" -C "${dest}" --strip-components 1
