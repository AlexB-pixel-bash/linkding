#!/bin/sh
set -eu

export UV_PYTHON=3.13
export UV_LOCKED=true

uv sync

mkdir -p data/assets data/favicons data/previews
npm ci
uv run manage.py migrate

make lint
#make test
