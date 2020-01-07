#!/bin/sh

echo "Pulling docker image"
docker pull bermeitingerb/texlive:$TEXLIVE


docker run \
	--rm \
    --volumes-from $(basename $(cat /proc/1/cpuset)) \
    -v "$(pwd):/data" \
    bermeitingerb/texlive:$TEXLIVE \
    latexmk