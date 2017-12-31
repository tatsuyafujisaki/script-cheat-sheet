#!/usr/bin/env bash

s=/a.a/b.b/c.c.txt 

echo 'original:' ${s}

echo 'dirname (#1) :' ${s%/*}
echo 'dirname (#2) :' $(dirname ${s})
echo 'filename without dir (#1) :' ${s##*/}
echo 'filename without dir (#2) :' $(basename ${s})
echo 'filename without extension :' $(basename ${s} .${s##*.})
echo 'fullpath without extension :' ${s%.*}
echo 'extname: ' ${s##*.}

echo 'fullpath: ' $(readlink -f ./../relative/path/to/foo.txt)

echo 'script dir as relative path: ' ${0%/*}
echo 'script dir as absolute path: ' $(cd ${0%/*} && pwd && cd - > /dev/null)
