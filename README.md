# dotfiles

Claude Code config and MCP server setup.

## Setup on a new machine

### 1. Prerequisites

Install Node.js and the Google Drive MCP server:

```bash
npm install -g @modelcontextprotocol/server-gdrive
```

### 2. Clone and install

```bash
git clone https://github.com/gmorales75/dotfiles ~/dotfiles
```

### 3. Create ~/.secrets

```bash
cp ~/dotfiles/.secrets.example ~/.secrets
chmod 600 ~/.secrets
```

Then edit `~/.secrets` and fill in your real values:

- `GITHUB_MCP_TOKEN` — a GitHub personal access token (Settings → Developer settings → Personal access tokens)

### 4. Run the install script

```bash
bash ~/dotfiles/install.sh
```

This will:
- Symlink `~/.claude/settings.json` from dotfiles
- Generate `~/.claude/.mcp.json` with your secrets filled in

### 5. Re-authenticate Google Drive

The OAuth credentials are machine-specific and not stored in this repo. Run:

```bash
cp /path/to/gcp-oauth.keys.json ~/.npm-global/lib/node_modules/gcp-oauth.keys.json
mcp-server-gdrive auth
```

Get `gcp-oauth.keys.json` from [Google Cloud Console](https://console.cloud.google.com) → APIs & Services → Credentials → your OAuth client → Download JSON.

### 6. Restart Claude Code

The new MCP servers will load on next launch.
