#!/bin/sh
set -eux
docker run -it --rm -v "$PWD":/project -p "4567:4567" luontola/web-intro:2018-02-22
