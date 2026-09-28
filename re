#!/usr/bin/env bash
# re - rename a file in place, keeping its directory
#   re path/to/my/file newname   ==   mv path/to/my/file path/to/my/newname
set -euo pipefail

if [ $# -ne 2 ]; then
	echo "usage: re PATH NEWNAME" >&2
	exit 2
fi

src=${1%/} # "dir/" renames dir
new=$2

case $new in
*/*) echo "re: NEWNAME must be a name, not a path: $new" >&2; exit 2 ;;
"" | . | ..) echo "re: invalid name: '$new'" >&2; exit 2 ;;
esac

if [ ! -e "$src" ] && [ ! -L "$src" ]; then
	echo "re: no such file: $src" >&2
	exit 1
fi

case $src in
*/*) dst=${src%/*}/$new ;;
*) dst=$new ;;
esac

if [ -e "$dst" ] || [ -L "$dst" ]; then
	echo "re: already exists: $dst" >&2
	exit 1
fi

mv -- "$src" "$dst"
