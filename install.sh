#!/usr/bin/env bash
# Install the paper-writing skills in this repo into ~/.agents/skills/ via symlinks.
# Idempotent: re-running updates stale links, skips correct ones, and refuses to
# overwrite a real directory (resolve manually with diff, then remove it).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.agents/skills"
SKILLS=(scientific-review language-polish jargon-check rebuttal)

mkdir -p "$TARGET_DIR"

status=0
for skill in "${SKILLS[@]}"; do
  src="${REPO_ROOT}/skills/${skill}"
  dst="${TARGET_DIR}/${skill}"

  if [ ! -d "${src}" ]; then
    echo "✗ ${skill}: source missing at ${src}" >&2
    status=1
    continue
  fi

  if [ -L "${dst}" ]; then
    current="$(readlink "${dst}")"
    if [ "${current}" = "${src}" ]; then
      echo "✓ ${skill}: already linked, skipped"
    else
      ln -sfn "${src}" "${dst}"
      echo "→ ${skill}: relinked (was ${current})"
    fi
  elif [ -e "${dst}" ]; then
    echo "✗ ${skill}: ${dst} exists and is not a symlink; diff it against ${src}, then remove it and re-run" >&2
    status=1
  else
    ln -s "${src}" "${dst}"
    echo "+ ${skill}: linked"
  fi
done

exit "${status}"
