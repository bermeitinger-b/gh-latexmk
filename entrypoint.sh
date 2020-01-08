#!/bin/sh

docker run \
	--rm \
	--volumes-from $(basename $(cat /proc/1/cpuset)) \
	-v "/out:/out" \
	bermeitingerb/texlive:$TEXLIVE \
    bash -c "\
        cd /github/workspace && \\
        latexmk -outdir=/build && \\
        cp /build/*.pdf /out/ && \\
        zip -r --exclude='*.git*' --exclude='latexmkrc' --exclude='README.md' /out/main.zip . && \\
        zip /out/main.zip -j /build/*.bbl
    "

