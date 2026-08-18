#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="jimeng-video-prompt"
REPO_ZIP="https://github.com/Susanzz101/Susan-AI-Video-Prompt-skill/archive/refs/heads/main.zip"
TMP_DIR="$(mktemp -d)"
DEST_ROOT="$HOME/.codex/skills"
DEST="$DEST_ROOT/$SKILL_NAME"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

curl -fsSL "$REPO_ZIP" -o "$TMP_DIR/repo.zip"
unzip -q "$TMP_DIR/repo.zip" -d "$TMP_DIR"

mkdir -p "$DEST_ROOT"
rm -rf "$DEST"

SOURCE_DIR="$(find "$TMP_DIR" -maxdepth 2 -type d -name "$SKILL_NAME" | head -n 1)"

if [ -z "$SOURCE_DIR" ] || [ ! -f "$SOURCE_DIR/SKILL.md" ]; then
  echo "SKILL.md not found in downloaded repository." >&2
  exit 1
fi

cp -R "$SOURCE_DIR" "$DEST"

echo "Installed Susan-AI视频提示词生成智能体 to $DEST"
echo "Restart Codex or open a new chat if the skill does not appear immediately."
