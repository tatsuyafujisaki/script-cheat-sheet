@echo off

title %~df0

git checkout -- .
git clean -df