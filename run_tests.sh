#!/usr/bin/env bash
# Build the fixture models with RENN and run every model's tests.
# Usage: RENN_DIR=/path/to/renn ./run_tests.sh
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
"$here/build_models.sh"
fail=0
for f in "$here"/models/*.json; do
  m="$(basename "$f" .json)"
  if ! ( cd "$here" && MODEL="$m" swipl -q -g main -t 'halt(1)' tests/model_tests.pl ); then fail=1; fi
done
exit $fail
