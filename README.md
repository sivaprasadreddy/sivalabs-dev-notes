My Tech Notes for Quick Reference
==================================

[![Deploy to GitHub Pages](https://github.com/sivaprasadreddy/sivalabs-dev-notes/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/sivaprasadreddy/sivalabs-dev-notes/actions/workflows/deploy-pages.yml)

https://sivaprasadreddy.github.io/sivalabs-dev-notes/

Local setup with mise
--------------------

With [mise](https://mise.jdx.dev/) installed, run from the repository root:

```bash
mise trust
mise install
mise run serve
```

mise manages Python 3.15 and creates and activates `.venv` automatically.
The `serve` and `build` tasks install dependencies from `requirements.txt` before
running MkDocs. Open http://127.0.0.1:8000/ after starting the server.

```bash
mise run install # Install dependencies only
mise run build   # Build the static site into site/
mise tasks       # List available tasks
```

Alternative setup with Docker
-----------------------------

Install and start Docker (for example, Docker Desktop). From the repository root,
run the Docker task with mise:

```bash
mise run docker:serve
```

Open http://127.0.0.1:8000/. The repository is mounted into the container so local
documentation edits trigger a reload. Press `Ctrl+C` to stop and remove the container.
Dependencies are installed inside the container each time it starts.

To build the static site with Docker, run:

```bash
mise run docker:build
```

The generated site is written to the repository's `site/` directory.
Both tasks use `scripts/docker.sh`. You can also run `bash scripts/docker.sh serve`
or `bash scripts/docker.sh build` directly without mise or a local Python installation.

Deployment
----------

In the repository's **Settings → Pages → Build and deployment**, set **Source** to **GitHub Actions**.
The workflow builds and deploys the site on every push to `main`. You can also run it manually from the **Actions** tab.
