#!/bin/sh

docker run \
	--rm \
	--volumes-from $(basename $(cat /proc/1/cpuset)) \
	bermeitingerb/texlive:$TEXLIVE \
    bash -c \
    	"cd /github/workspace && \\
    	 latexmk && \\
    	 cp main.pdf /main-$TEXLIVE.pdf && \\
    	 latexmk -C && \\
    	 zip -r --exclude='*.git*' --exclude='*.circleci*' --exclude='latexmkrc' --exclude='README.md' /arxiv-$TEXLIVE.zip .
    "
