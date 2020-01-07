#!/bin/sh

docker run \
	--rm \
    -v "/github/workspace:/data" \
    bermeitingerb/texlive:$TEXLIVE \
    latexmk -r latexmkrc