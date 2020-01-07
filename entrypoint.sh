#!/bin/sh

docker run \
	--rm \
	--volumes-from $(basename $(cat /proc/1/cpuset)) \
	-v "/out:/out" \
	bermeitingerb/texlive:$TEXLIVE \
    bash -c \
    	"cd /github/workspace && \\
    	 rm -rf /out/artifact && \\
    	 latexmk -outdir=/out/artifact && \\
    	 cp /out/artifact/*.bbl . && \\
         cp /out/artifact/*.pdf /out && \\
    	 zip -r --exclude='*.git*' --exclude='latexmkrc' --exclude='README.md' /out/main.zip ."

