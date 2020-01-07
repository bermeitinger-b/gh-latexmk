#!/bin/sh

docker run \
	--rm \
	--volumes-from $(basename $(cat /proc/1/cpuset)) \
	bermeitingerb/texlive:$TEXLIVE \
    bash -c \
    	"cd /github/workspace && \\
    	 rm -rf /out && \\
    	 latexmk -outdir=/out && \\
    	 cp /out/*.bbl . && \\
    	 zip -r --exclude='*.git*' --exclude='latexmkrc' --exclude='README.md' main.zip . && \\
    	 cp /out/*.pdf .
    "
