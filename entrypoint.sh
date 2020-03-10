#!/bin/sh

docker run \
	--rm \
	--volumes-from $(basename $(cat /proc/1/cpuset)) \
	-v "/out:/out" \
	bermeitingerb/texlive:$TEXLIVE \
    bash -c "\
        cd /github/workspace && \\
        latexmk && \\
	cp main.pdf /out/main.pdf && \\
        latexmk -C && \\
        zip -r --exclude='*.git*' --exclude='latexmkrc' --exclude='README.md' /out/main.zip .
    "

