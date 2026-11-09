#!/usr/bin/env bash
set -euo pipefail

project_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

case "${1:-serve}" in
  serve)
    docker_args=(--rm --publish 127.0.0.1:8000:8000)
    if [[ -t 0 && -t 1 ]]; then
      docker_args+=(-it)
    fi
    command='python -m pip install -r requirements.txt && exec mkdocs serve --dev-addr 0.0.0.0:8000'
    ;;
  build)
    docker_args=(--rm)
    command='python -m pip install -r requirements.txt && exec mkdocs build --config-file mkdocs.yml'
    ;;
  *)
    echo "Usage: $0 [serve|build]" >&2
    exit 1
    ;;
esac

exec docker run "${docker_args[@]}" \
  --mount "type=bind,source=${project_root},target=/docs" \
  --workdir /docs \
  python:3.15-slim \
  sh -c "$command"
