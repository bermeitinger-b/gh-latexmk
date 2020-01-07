#!/bin/sh

echo "Pulling docker image"
docker pull bermeitingerb/texlive:$TEXLIVE


docker run \
	--rm \
    -v "/github/workspace:/data" \
    bermeitingerb/texlive:$TEXLIVE \
    latexmk