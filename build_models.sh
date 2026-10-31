#!/usr/bin/env bash
# Build every model in models/ with RENN (python -m renn build) into build/<model>.
# Usage: RENN_DIR=/path/to/renn ./build_models.sh
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
: "${RENN_DIR:?set RENN_DIR to a renn checkout}"
for f in "$here"/models/*.json; do
  m="$(basename "$f" .json)"
  ( cd "$RENN_DIR" && python3 -m renn build "$f" --output "$here/build/$m" >/dev/null )
  echo "built $m"
done
