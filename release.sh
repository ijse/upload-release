#!/bin/bash

FILE=./index.html

function append () {
  echo $1 | cat - $FILE > temp && mv temp $FILE
}

for file in `ls */*`; do append "<a href='${file}'>${file}</a><br/>"; done

append "<h2><time>`date`</time></h2>"


tiger-cdn . release

rm */*

git add .
git commit -A -m "release"
git push -u origin master

