#!/bin/sh

docker run \
	--rm \
	-w "/data" \
    -v "/github/workspace:/data" \
    bermeitingerb/texlive:$TEXLIVE \
    bash -c "cd /data && latexmk"
