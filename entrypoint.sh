#!/bin/sh

echo "Pulling docker image"
docker pull bermeitingerb/texlive:$TEXLIVE

echo "/github/workspace"
ls /github/workspace

echo "pwd"
ls $(pwd)

cd /github/workspace

docker run \
	--rm \
    -v "/github/workspace:/data" \
    bermeitingerb/texlive:$TEXLIVE \
    latexmk