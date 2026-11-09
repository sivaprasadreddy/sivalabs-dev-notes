My Tech Notes for Quick Reference
==================================

[![Deploy to GitHub Pages](https://github.com/sivaprasadreddy/sivalabs-dev-notes/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/sivaprasadreddy/sivalabs-dev-notes/actions/workflows/deploy-pages.yml)

https://sivaprasadreddy.github.io/sivalabs-dev-notes/

* Use Python 3.12 and install dependencies: `python -m pip install -r requirements.txt`
* Run locally: `mkdocs serve` and open http://127.0.0.1:8000/
* Build locally: `mkdocs build --config-file mkdocs.yml`

Deployment
----------

In the repository's **Settings → Pages → Build and deployment**, set **Source** to **GitHub Actions**.
The workflow builds and deploys the site on every push to `main`. You can also run it manually from the **Actions** tab.

Disconnect the repository from Netlify to stop its automatic deployments.
