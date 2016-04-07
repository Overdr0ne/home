#!/bin/bash

git clone git@git.lpdev.prtdev.lexmark.com:build-bundle.git
cd build-bundle
git remote add gitlpm git@gitlabfw.rds.lexmark.com:lpm-dev/build-bundle.git
git fetch --all
git submodule update --init
cd meta-lexmark
git remote add gitlpm git@gitlabfw.rds.lexmark.com:lpm-dev/meta-lexmark.git
git fetch --all
cd ..
