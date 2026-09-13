#!/bin/sh
set -eu

mise="$HOME/.local/bin/mise"
if [ ! -x "$mise" ]; then
  curl -fsSL https://mise.run | sh
fi

"$mise" --version
