#!/bin/sh

set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
cd "$ROOT_DIR"

echo "==> Checking Zsh syntax"
if [ -f .zshrc.local ]; then
  zsh -n .zshrc .zshrc.local
else
  zsh -n .zshrc
fi

echo "==> Checking TOML syntax"
python3 - <<'PY'
from pathlib import Path
import subprocess

try:
    import tomllib
except ModuleNotFoundError:
    try:
        import tomli as tomllib  # type: ignore
    except ModuleNotFoundError as exc:
        raise SystemExit("python3.11+ or tomli is required to validate TOML files") from exc

files = subprocess.check_output(["git", "ls-files", "*.toml"], text=True).splitlines()
for file in files:
    tomllib.loads(Path(file).read_text())
    print(file)
PY

echo "==> Checking Lua syntax"
LUAC_BIN=""
for candidate in luac luac5.4 luac5.3 luac5.2; do
  if command -v "$candidate" >/dev/null 2>&1; then
    LUAC_BIN="$candidate"
    break
  fi
done

if [ -z "$LUAC_BIN" ]; then
  echo "luac was not found" >&2
  exit 1
fi

lua_files_tmp="$(mktemp)"
trap 'rm -f "$lua_files_tmp"' EXIT HUP INT TERM

find nvim -name '*.lua' -print > "$lua_files_tmp"

while IFS= read -r file; do
  [ -n "$file" ] || continue
  "$LUAC_BIN" -p "$file"
  echo "$file"
done < "$lua_files_tmp"

echo "All checks passed."
