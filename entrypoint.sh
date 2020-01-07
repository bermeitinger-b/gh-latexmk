#!/bin/sh

docker run \
	--rm \
	--volumes-from $(basename $(cat /proc/1/cpuset)) \
	bermeitingerb/texlive:$TEXLIVE \
    bash -c "cd /github/workspace && latexmk"
