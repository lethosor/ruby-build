@echo off
rem adapted from https://gist.github.com/vvuk/01dc8a12678d1beffaa1e26549d03b02

bash -c "env | sort > env1.txt"
call "%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

for %%p in ("%PATH:;=" "%") do (
    echo %%~p>>%GITHUB_PATH%
)

bash -c "env | sort > env2.txt"
bash -c "comm -13 env1.txt env2.txt | grep -v ^PATH= | tee -a $GITHUB_ENV"
del env1.txt env2.txt
