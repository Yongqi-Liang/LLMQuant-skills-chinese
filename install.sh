#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="${1:-}"
TARGET="${2:-claude}"
SCOPE="${3:-global}"

REPO_URL="${LLMQUANT_SKILLS_REPO:-https://github.com/LLMQuant/skills.git}"
TMP_DIR=""

usage() {
  echo "Usage: install.sh <category-skill-name> [claude|codex] [global|project]"
  echo
  echo "Examples:"
  echo "  ./install.sh llmquant-options claude"
  echo "  ./install.sh llmquant-etfs codex"
  echo "  ./install.sh llmquant-portfolio claude project"
}

cleanup() {
  if [ -n "$TMP_DIR" ] && [ -d "$TMP_DIR" ]; then
    rm -rf "$TMP_DIR"
  fi
}
trap cleanup EXIT

if [ -z "$SKILL_NAME" ]; then
  usage
  exit 1
fi

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
SOURCE_ROOT="$SCRIPT_DIR"

if [ ! -d "$SOURCE_ROOT/skills/$SKILL_NAME" ]; then
  TMP_DIR="$(mktemp -d)"
  git clone --depth 1 "$REPO_URL" "$TMP_DIR" >/dev/null
  SOURCE_ROOT="$TMP_DIR"
fi

SOURCE="$SOURCE_ROOT/skills/$SKILL_NAME"

if [ ! -f "$SOURCE/SKILL.md" ]; then
  echo "Skill not found: $SKILL_NAME"
  echo
  echo "Available skills:"
  find "$SOURCE_ROOT/skills" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort
  exit 1
fi

case "$TARGET" in
  claude)
    if [ "$SCOPE" = "project" ]; then
      DEST=".claude/skills"
    else
      DEST="$HOME/.claude/skills"
    fi
    ;;
  codex)
    if [ "$SCOPE" = "project" ]; then
      DEST=".agents/skills"
    else
      DEST="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
    fi
    ;;
  *)
    echo "Unknown target: $TARGET"
    echo "Use: claude or codex"
    exit 1
    ;;
esac

mkdir -p "$DEST"
rm -rf "$DEST/$SKILL_NAME"
cp -R "$SOURCE" "$DEST/$SKILL_NAME"

echo "Installed $SKILL_NAME to $DEST/$SKILL_NAME"

if [ "$TARGET" = "codex" ]; then
  echo "Restart Codex to pick up new skills."
fi
