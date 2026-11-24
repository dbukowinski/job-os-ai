#!/usr/bin/env bash
# Buduje paczki do pobrania / Builds downloadable packages:
#   dist/JOB_OS_Pakiet_Startowy_v<wersja>.zip  — wersja polska (folder pl/)
#   dist/JOB_OS_Starter_Pack_v<version>.zip    — English edition (folder en/)
# Wersja z pierwszego nagłówka CHANGELOG.md / version from the first CHANGELOG.md heading.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$ROOT/dist"
VERSION="$(grep -m1 -E '^## [0-9]+\.[0-9]+' "$ROOT/CHANGELOG.md" | awk '{print $2}' | cut -d. -f1,2)"
mkdir -p "$DIST"

build() {
  local src="$1" folder="$2" zip_name="$3"
  local tmp
  tmp="$(mktemp -d)"
  cp -R "$ROOT/$src" "$tmp/$folder"
  rm -f "$DIST/$zip_name"
  (cd "$tmp" && zip -q -r -X "$DIST/$zip_name" "$folder" -x '*.DS_Store')
  rm -rf "$tmp"
  echo "built dist/$zip_name"
}

rm -f "$DIST"/JOB_OS_*.zip
build pl "Job_OS_Pakiet_Startowy" "JOB_OS_Pakiet_Startowy_v${VERSION}.zip"
build en "Job_OS_Starter_Pack" "JOB_OS_Starter_Pack_v${VERSION}.zip"
