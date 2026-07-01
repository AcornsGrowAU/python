# docker-python

Rocky Linux-based Python base images, rebuilt weekly with OS security updates.

## Tags

Built per Python minor version (Rocky 9 AppStream `python<X.Y>` streams):

- `acornsaustralia/python:3.11`
- `acornsaustralia/python:3.12`
- `acornsaustralia/python:3.14`

Each build is also pinned as `:<version>-<GITHUB_RUN_NUMBER>`. In every image `python3` / `python` / `pip3` / `pip` resolve to that version.

## Adding a version

Add the stream to the `ver` matrix in `docker-bake.hcl` — it must be an available Rocky AppStream `python<X.Y>` package.
