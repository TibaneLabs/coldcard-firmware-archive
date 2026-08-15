#!/bin/bash
# Verify every .dfu here against the official signatures.txt SHA256 manifest.
cd "$(dirname "$0")"; ok=0; bad=0; miss=0
while read -r sha fn; do
  [ -z "$fn" ] || [[ "$sha" != ????????* ]] && continue
  p=$(find . -name "$fn" | head -1)
  if [ -z "$p" ]; then echo "MISSING $fn"; miss=$((miss+1)); continue; fi
  g=$(sha256sum "$p" | cut -d' ' -f1)
  if [ "$g" = "$sha" ]; then ok=$((ok+1)); else echo "MISMATCH $fn"; bad=$((bad+1)); fi
done < <(grep -E "coldcard.*\.dfu" signatures.txt)
echo "verified=$ok mismatch=$bad missing=$miss"
