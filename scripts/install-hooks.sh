#!/usr/bin/env bash
set -euo pipefail

root="$(git rev-parse --show-toplevel)"
hooks_dir="$root/.git/hooks"
mkdir -p "$hooks_dir"

cat > "$hooks_dir/commit-msg" <<'HOOK'
#!/usr/bin/env bash
set -euo pipefail
message_file="$1"
first_line="$(head -n 1 "$message_file")"
if ! printf '%s' "$first_line" | grep -Eq '^(feat|fix|docs|test|chore|refactor|ci|build|perf|revert)(\([a-z0-9._-]+\))?: .+'; then
  echo "Commit message must use conventional commit style." >&2
  echo "Example: feat: add user lookup" >&2
  exit 1
fi
HOOK

cat > "$hooks_dir/pre-push" <<'HOOK'
#!/usr/bin/env bash
set -euo pipefail
echo "pre-push: run 'mvn test' before pushing if Java files changed."
HOOK

chmod +x "$hooks_dir/commit-msg" "$hooks_dir/pre-push"
echo "Installed commit-msg and pre-push hooks in $hooks_dir"
