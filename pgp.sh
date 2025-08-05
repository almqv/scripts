#!/bin/sh
# Usage:
#   ./pgp_all.sh encrypt "password"
#   ./pgp_all.sh decrypt "password"

MODE="$1"
PASSPHRASE="$2"

if [ -z "$MODE" ] || [ -z "$PASSPHRASE" ]; then
  echo "Usage: $0 encrypt|decrypt \"password\""
  exit 1
fi

if [ "$MODE" = "encrypt" ]; then
  find . -type f ! -name "*.gpg" -maxdepth 1 | while IFS= read -r f; do
    [ -f "$f" ] || continue
    # Encrypt and remove original
    gpg --batch --yes --passphrase "$PASSPHRASE" --pinentry-mode loopback \
        --symmetric --cipher-algo AES256 "$f" && rm -f "$f"
    # Base64 encode in-place
    cat "$f.gpg" | base64 > "$f.gpg.tmp" && mv "$f.gpg.tmp" "$f.gpg"
  done

elif [ "$MODE" = "decrypt" ]; then
  find . -type f -name "*.gpg" -maxdepth 1 | while IFS= read -r f; do
    [ -f "$f" ] || continue
    out="${f%.gpg}"
    tmp_decoded="$(mktemp)"
    # Base64 decode then decrypt
    cat "$f" | base64 -D > "$tmp_decoded"
    gpg --batch --yes --passphrase "$PASSPHRASE" --pinentry-mode loopback \
        --output "$out" --decrypt "$tmp_decoded" && rm -f "$f" "$tmp_decoded"
  done

else
  echo "Usage: $0 encrypt|decrypt \"password\""
  exit 1
fi
