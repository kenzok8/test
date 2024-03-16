#!/bin/bash

set -x

export CURDIR="$(cd "$(dirname $0)"; pwd)"

function update_version() {
    local type="$1"
    local repo="$2"
    local res="$3"
    local version_type="$4"
    local hash_type="$5"
    local tag version sha line

    tag="$(curl -H "Authorization: $GITHUB_TOKEN" -sL "https://api.github.com/repos/$repo/releases/latest" | jq -r ".tag_name")"
    [ -n "$tag" ] || return 1

    version="$(awk -F "${version_type}:=" '{print $2}' "$CURDIR/Makefile" | xargs)"
    [ "$tag" != "$version" ] || return 2

    sha="$(curl -fsSL "https://github.com/$repo/releases/download/$tag/$res" | awk '{print $1}')"
    [ -n "$sha" ] || return 1

    line="$(awk "/${hash_type}:=/ {print NR}" "$CURDIR/Makefile")"
    sed -i -e "s/${version_type}:=.*/${version_type}:=$tag/" \
           -e "${line}s/${hash_type}:=.*/${hash_type}:=$sha/" \
           "$CURDIR/Makefile"
}

update_version "chinadns-ng" "zfl9/chinadns-ng" "chinadns-ng@aarch64-linux-musl@generic+v8a@fast+lto.sha256sum" "PKG_VERSION" "PKG_HASH"
update_version "chinadns-ng" "zfl9/chinadns-ng" "chinadns-ng@arm-linux-musleabi@generic+v7a@fast+lto.sha256sum" "PKG_VERSION" "PKG_HASH"
update_version "chinadns-ng" "zfl9/chinadns-ng" "chinadns-ng@arm-linux-musleabihf@generic+v7a@fast+lto.sha256sum" "PKG_VERSION" "PKG_HASH"
update_version "chinadns-ng" "zfl9/chinadns-ng" "chinadns-ng@mips-linux-musl@mips32@fast+lto.sha256sum" "PKG_VERSION" "PKG_HASH"
update_version "chinadns-ng" "zfl9/chinadns-ng" "chinadns-ng@mipsel-linux-musl@mips32@fast+lto.sha256sum" "PKG_VERSION" "PKG_HASH"
update_version "chinadns-ng" "zfl9/chinadns-ng" "chinadns-ng@i386-linux-musl@i686@fast+lto.sha256sum" "PKG_VERSION" "PKG_HASH"
update_version "chinadns-ng" "zfl9/chinadns-ng" "chinadns-ng@x86_64-linux-musl@x86_64@fast+lto.sha256sum" "PKG_VERSION" "PKG_HASH"