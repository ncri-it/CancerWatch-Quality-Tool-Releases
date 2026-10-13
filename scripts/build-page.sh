#!/usr/bin/env bash
# Builds the deployable download page: copies site/ to an output folder, fills the release
# placeholders in index.html and keeps either the macOS download button or its "Coming soon"
# slot. The deploy workflow calls this with values read from the latest release; run it
# locally with any values to preview the result.
#
#   VERSION=2.1.1 RELEASE_DATE="12 Oct 2026" WINDOWS_SIZE="98 MB" LINUX_SIZE="104 MB" \
#   MACOS_SIZE="101 MB" bash scripts/build-page.sh site build
#
# Leave MACOS_SIZE empty (or unset) to build the page without a macOS installer.
set -euo pipefail

src="${1:?source folder (site)}"
out="${2:?output folder}"

for name in VERSION RELEASE_DATE WINDOWS_SIZE LINUX_SIZE; do
  if [ -z "${!name:-}" ]; then
    echo "::error::$name is not set" >&2
    exit 1
  fi
done
MACOS_SIZE="${MACOS_SIZE:-}"

rm -rf "$out"
mkdir -p "$out"
cp -R "$src"/. "$out"/
page="$out/index.html"

# Keep one of the two marked macOS blocks and drop the other, markers included.
if [ -n "$MACOS_SIZE" ]; then
  sed -i -e '/<!--MACOS_COMING-->/,/<!--\/MACOS_COMING-->/d' -e '/<!--\/\?MACOS_AVAILABLE-->/d' "$page"
  macos_state="macOS $MACOS_SIZE"
else
  sed -i -e '/<!--MACOS_AVAILABLE-->/,/<!--\/MACOS_AVAILABLE-->/d' -e '/<!--\/\?MACOS_COMING-->/d' "$page"
  macos_state="macOS coming soon"
fi

# Plain string replacement; the values are a version, a short date and a size, none of
# which contain the delimiter.
sed -i \
  -e "s|{{VERSION}}|$VERSION|g" \
  -e "s|{{RELEASE_DATE}}|$RELEASE_DATE|g" \
  -e "s|{{WINDOWS_SIZE}}|$WINDOWS_SIZE|g" \
  -e "s|{{MACOS_SIZE}}|$MACOS_SIZE|g" \
  -e "s|{{LINUX_SIZE}}|$LINUX_SIZE|g" \
  "$page"

# Fail rather than publish a page with an unfilled placeholder or a leftover marker.
if grep -n -e '{{[A-Z_]*}}' -e '<!--/\?MACOS_' "$page"; then
  echo "::error::index.html still contains placeholders or block markers" >&2
  exit 1
fi

echo "Built $out: version $VERSION, $RELEASE_DATE, Windows $WINDOWS_SIZE, Linux $LINUX_SIZE, $macos_state"
