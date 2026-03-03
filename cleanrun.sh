#!/usr/bin/env bash
set -e

# Auto-detect GRUB tool
if command -v grub2-mkrescue &>/dev/null; then
    GRUB="grub2-mkrescue"
elif command -v grub-mkrescue &>/dev/null; then
    GRUB="grub-mkrescue"
else
    echo "Error: grub-mkrescue or grub2-mkrescue not found, please refer to https://github.com/zen2arc/kTTY/wiki/Building-from-source"
    exit 1
fi

echo "Using GRUB tool: $GRUB"

make clean
make -j "$(nproc)" run GRUB="$GRUB"