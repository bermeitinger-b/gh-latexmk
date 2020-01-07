#!/bin/sh

docker run \
	--rm \
	--volumes-from $(basename $(cat /proc/1/cpuset)) \
	-w "/data" \
    -v "/github/workspace:/data" \
    bermeitingerb/texlive:$TEXLIVE \
    latexmk
