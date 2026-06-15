#!/usr/bin/env bash
# Preview staging v4 locally (concise home + Article References).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [[ ! -x .venv/bin/mkdocs ]]; then
  echo "Setting up local Python environment (first run only)..."
  uv venv .venv
  uv pip install -r requirements.txt
fi

echo "Starting v4 preview at http://127.0.0.1:8004/"
exec .venv/bin/mkdocs serve -f mkdocs.dev.v4.yml -a 127.0.0.1:8004
