#!/usr/bin/env bash
# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/).
# Copyright 2026-present Datadog, Inc.
#
# Usage: scripts/update-formula.sh <formula> <version>
# Example: scripts/update-formula.sh pup 0.32.0
#
# Updates a Homebrew formula to a new version by fetching SHA256 checksums
# from the GitHub release, creating a branch, committing, and opening a PR.

set -euo pipefail

FORMULA="${1:-}"
VERSION="${2:-}"

if [[ -z "${FORMULA}" || -z "${VERSION}" ]]
then
  echo "Usage: $0 <formula> <version>" >&2
  exit 1
fi

FORMULA_FILE="Formula/${FORMULA}.rb"

if [[ ! -f "${FORMULA_FILE}" ]]
then
  echo "Formula file not found: ${FORMULA_FILE}" >&2
  exit 1
fi

# Derive repo from the formula's homepage field
REPO=$(grep 'homepage' "${FORMULA_FILE}" | sed -E 's|.*"https://github.com/([^"]+)".*|\1|')
if [[ -z "${REPO}" ]]
then
  echo "Could not determine GitHub repo from formula homepage" >&2
  exit 1
fi

echo "Updating ${FORMULA} to v${VERSION} from ${REPO}..."

# Fetch checksums from the release
CHECKSUMS=$(gh release download "v${VERSION}" --repo "${REPO}" --pattern '*checksums.txt' --output -)

get_sha() {
  local filename="$1"
  # use awk exact match to avoid matching .sbom.json variants
  echo "${CHECKSUMS}" | awk -v f="${filename}" '$2 == f {print $1}'
}

DARWIN_ARM64=$(get_sha "${FORMULA}_${VERSION}_Darwin_arm64.tar.gz")
DARWIN_X86_64=$(get_sha "${FORMULA}_${VERSION}_Darwin_x86_64.tar.gz")
LINUX_ARM64=$(get_sha "${FORMULA}_${VERSION}_Linux_arm64.tar.gz")
LINUX_X86_64=$(get_sha "${FORMULA}_${VERSION}_Linux_x86_64.tar.gz")

for var in DARWIN_ARM64 DARWIN_X86_64 LINUX_ARM64 LINUX_X86_64
do
  if [[ -z "${!var}" ]]
  then
    echo "Could not find checksum for ${var}" >&2
    exit 1
  fi
done

CURRENT_VERSION=$(grep -m 1 'releases/download/v' "${FORMULA_FILE}" | sed -E 's|.*releases/download/v([^/]+)/.*|\1|')
if [[ -z "${CURRENT_VERSION}" ]]
then
  echo "Could not determine current version from formula URLs" >&2
  exit 1
fi

BRANCH="update-${FORMULA}-${VERSION}"

git checkout -b "${BRANCH}"

# Replace version and all URLs/checksums in one sed pass
sed -i '' \
  -e "s|version \"${CURRENT_VERSION}\"|version \"${VERSION}\"|g" \
  -e "s|/v${CURRENT_VERSION}/${FORMULA}_${CURRENT_VERSION}_Darwin_arm64.tar.gz|/v${VERSION}/${FORMULA}_${VERSION}_Darwin_arm64.tar.gz|g" \
  -e "s|/v${CURRENT_VERSION}/${FORMULA}_${CURRENT_VERSION}_Darwin_x86_64.tar.gz|/v${VERSION}/${FORMULA}_${VERSION}_Darwin_x86_64.tar.gz|g" \
  -e "s|/v${CURRENT_VERSION}/${FORMULA}_${CURRENT_VERSION}_Linux_arm64.tar.gz|/v${VERSION}/${FORMULA}_${VERSION}_Linux_arm64.tar.gz|g" \
  -e "s|/v${CURRENT_VERSION}/${FORMULA}_${CURRENT_VERSION}_Linux_x86_64.tar.gz|/v${VERSION}/${FORMULA}_${VERSION}_Linux_x86_64.tar.gz|g" \
  "${FORMULA_FILE}"

# Update checksums (match existing sha256 lines by position relative to their url)
python3 - "${FORMULA_FILE}" "${DARWIN_ARM64}" "${DARWIN_X86_64}" "${LINUX_ARM64}" "${LINUX_X86_64}" <<'EOF'
import sys, re

path, darwin_arm64, darwin_x86_64, linux_arm64, linux_x86_64 = sys.argv[1:]

sha_map = {
    "Darwin_arm64":  darwin_arm64,
    "Darwin_x86_64": darwin_x86_64,
    "Linux_arm64":   linux_arm64,
    "Linux_x86_64":  linux_x86_64,
}

with open(path) as f:
    content = f.read()

# Replace each sha256 that follows a url containing a known platform suffix
def replace_sha(match):
    platform = match.group(1)
    return f'sha256 "{sha_map[platform]}"'

# match sha256 values that may span multiple lines (e.g. from a previous buggy run)
pattern = r'url "[^"]*_(Darwin_arm64|Darwin_x86_64|Linux_arm64|Linux_x86_64)\.tar\.gz"\n(\s+)sha256 "[a-f0-9\n]+"'

def replacer(m):
    platform = m.group(1)
    indent = m.group(2)
    url_line = m.group(0).split('\n')[0]
    return f'{url_line}\n{indent}sha256 "{sha_map[platform]}"'

content = re.sub(pattern, replacer, content)

with open(path, 'w') as f:
    f.write(content)
EOF

git add "${FORMULA_FILE}"
git commit -m "Update ${FORMULA} to v${VERSION}"
git push -u origin "${BRANCH}"

PR_BODY=$(
  cat <<PREOF
## Summary
- Updates \`${FORMULA}\` formula from v${CURRENT_VERSION} to v${VERSION}
- Updates all SHA256 checksums for macOS (arm64, x86_64) and Linux (arm64, x86_64)

## Test plan
- [ ] \`brew install datadog-labs/pack/${FORMULA}\` installs successfully
- [ ] \`${FORMULA} --help\` outputs expected help text

🤖 Generated with [Claude Code](https://claude.com/claude-code)
PREOF
)

PR_URL=$(gh pr create \
  --title "Update ${FORMULA} to v${VERSION}" \
  --body "${PR_BODY}")

echo "PR created: ${PR_URL}"

read -r -p "Merge PR with admin? [y/N] " MERGE_CONFIRM
if [[ "${MERGE_CONFIRM,,}" == "y" ]]
then
  gh pr merge --admin --squash "${PR_URL}"
  echo "PR merged."
else
  echo "Skipping merge."
fi
