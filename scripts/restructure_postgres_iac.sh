#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${1:-$(pwd)}"

POSTGRES_IAC_DIR="$REPO_ROOT/iac/middleware/postgres"
POSTGRES_CHART_DIR="$POSTGRES_IAC_DIR/chart"
POSTGRES_TARGET_DIR="$REPO_ROOT/target/helm/middleware/postgres"
POSTGRES_TARGET_CHART_DIR="$POSTGRES_TARGET_DIR/chart"
GITIGNORE_FILE="$REPO_ROOT/.gitignore"
SOURCE_FILE="$POSTGRES_IAC_DIR/source.yaml"

echo "==> Verifying repository structure..."
test -d "$POSTGRES_IAC_DIR" || { echo "Missing directory: $POSTGRES_IAC_DIR"; exit 1; }

echo "==> Creating target directory..."
mkdir -p "$POSTGRES_TARGET_DIR"

if [ -d "$POSTGRES_CHART_DIR" ]; then
  echo "==> Moving unpacked Helm chart from iac/ to target/ ..."
  mv "$POSTGRES_CHART_DIR" "$POSTGRES_TARGET_CHART_DIR"
else
  echo "==> No chart directory found at $POSTGRES_CHART_DIR; skipping move"
fi

if [ ! -f "$SOURCE_FILE" ]; then
  echo "==> Creating source.yaml ..."
  cat > "$SOURCE_FILE" <<'EOF'
release:
  name: postgres
  namespace: middleware

chart:
  name: postgresql
  repo: oci://registry-1.docker.io/bitnamicharts
  version: 18.5.6
EOF
else
  echo "==> source.yaml already exists; skipping"
fi

if [ -f "$GITIGNORE_FILE" ]; then
  if ! grep -qxF 'target/' "$GITIGNORE_FILE"; then
    echo "==> Adding target/ to .gitignore ..."
    printf '\n# Generated build artifacts\ntarget/\n' >> "$GITIGNORE_FILE"
  else
    echo "==> .gitignore already contains target/"
  fi
else
  echo "==> Creating .gitignore with target/ ..."
  cat > "$GITIGNORE_FILE" <<'EOF'
# Generated build artifacts
target/
EOF
fi

echo "==> Final structure:"
tree "$REPO_ROOT/iac" "$REPO_ROOT/target" 2>/dev/null || true

echo "==> Done."
echo
echo "Next checks:"
echo "  - Confirm iac/middleware/postgres/source.yaml"
echo "  - Confirm target/helm/middleware/postgres/chart exists"
echo "  - Confirm .gitignore includes target/"
