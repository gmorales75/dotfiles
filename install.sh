#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load secrets
if [ -f "$HOME/.secrets" ]; then
  source "$HOME/.secrets"
else
  echo "WARNING: ~/.secrets not found."
  echo "Copy $DOTFILES/.secrets.example to ~/.secrets and fill in real values, then re-run."
  exit 1
fi

# Claude settings.json — symlink directly (no secrets)
ln -sf "$DOTFILES/claude/settings.json" "$HOME/.claude/settings.json"
echo "Linked settings.json"

# .mcp.json — generate from template (has secrets)
envsubst < "$DOTFILES/claude/.mcp.json.template" > "$HOME/.claude/.mcp.json"
echo "Generated .mcp.json"

# Claude slash commands — symlink each command file
mkdir -p "$HOME/.claude/commands"
for cmd in "$DOTFILES/claude/commands/"*.md; do
  ln -sf "$cmd" "$HOME/.claude/commands/$(basename "$cmd")"
  echo "Linked command: $(basename "$cmd")"
done

echo "Done. Restart Claude Code to pick up changes."
