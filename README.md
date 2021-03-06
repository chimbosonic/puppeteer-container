# Puppeteer OCI image

![pipeline status](https://github.com/chimbosonic/puppeteer-container/actions/workflows/main.yml/badge.svg?branch=main)

This is a puppeteer OCI image built using https://github.com/puppeteer/puppeteer.

Base image is `node:lts-buster-slim`.

The image is available on Docker Hub [here](https://hub.docker.com/repository/docker/chimbosonic/puppeteer)

Source code and pipeline can be found [here](https://github.com/chimbosonic/puppeteer-container)

## Image Version

Image is tag based on the version of puppeteer.

For example: `puppeteer:14.1.1-latest` will have `puppeteer@14.1.1` installed.

`puppeteer:latest` will be on the latest version released by this repo.

## Image Verification

The image is signed using [cosign](https://github.com/sigstore/cosign) from sigstore.

You can verify the signature with:

```bash
cosign verify --key cosign.pub chimbosonic/puppeteer:latest
```

## Running it

Please see the [tests](./tests/README.md) as a example 

### How to build

This will build the container.

```bash
make build
```

### How to test

```bash
make test
```

Test included is from [`buildkite/docker-puppeteer`](https://github.com/buildkite/docker-puppeteer) to make sure its is compatible.

### NOTES
All credit to the maintainers of [puppeteer](https://github.com/puppeteer/puppeteer).

Based on [`buildkite/docker-puppeteer`](https://github.com/buildkite/docker-puppeteer)

#### Update process

The image will be auto update with the latest lts node image and latest deps for a given version of puppeteer every Sunday.

To bump the version of puppeteer itself update the [Dockerfile](./Dockerfile) and the [Github Action](./.github/workflows/main.yml).
