# docker-python

Python base images built on Rocky Linux 10 Minimal. Images are rebuilt weekly
to include current operating-system security updates.

## Tags

Images are published for Python versions available from Rocky Linux 10
AppStream:

- `acornsaustralia/python:3.12`
- `acornsaustralia/python:3.14`

Each CI build also receives a build-specific
`:<version>-<GITHUB_RUN_NUMBER>` tag. The version tags are rolling tags and are
updated by the weekly rebuild.

Images are published for `linux/amd64` and `linux/arm64`. In every image,
`python`, `python3`, `pip`, and `pip3` resolve to the selected Python version.

## Usage

```dockerfile
FROM acornsaustralia/python:3.12
```

The base image does not select a non-root user. Application images should
create and switch to an appropriate unprivileged user before runtime.

## Build locally

Build both Python versions for the local machine's image store:

```bash
docker buildx bake --load --set="*.platform=linux/amd64"
```

On an ARM64 machine, replace `linux/amd64` with `linux/arm64`.

## Adding a version

Add the version to the `ver` matrix in `docker-bake.hcl`. Both
`python<X.Y>` and `python<X.Y>-pip` must be available from Rocky Linux 10
AppStream. CI must also include the corresponding generated target, such as
`python-3-14`, in its matrix.
